#network config





{ config, pkgs, lib, ... }:

{
	networking.useNetworkd = true;
	systemd.network.enable = true;

    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 80 
                            53
                            443  
                            63 
                            6697
                          ];
        allowedUDPPorts = [ 53 63 ];
        logRefusedPackets = true;
        #trustInterfaces = [ add tap device for qemu? ];
      };

	#tap interface
	systemd.network.netdevs."qemu-tap" = {
  		enable = true;
  		netdevConfig = {
			Kind = "tap";
			Name = "qemu-tap";
		};	
		tapConfig = {
				User = "planimal";
		};
  		# macAddress = "52:54:00:ff:00:01";
	};
	systemd.network.networks."40-qemu-tap-to-br0" = {
	  matchConfig.Name = "qemu-tap";
	  networkConfig = {
		# Specify the bridge interface it should belong to
		Bridge = "br0";
		DHCP = "no";
	  };
	  linkConfig.RequiredForOnline = "yes";
	};	

	#bridge interface, linked with enps30
	networking.bridges = {
		"br0" = {
			interfaces = [ "enp3s0" ];
		};
	};
	systemd.network.networks."20-br0" = {
		matchConfig.Name = "br0";
#        DHCP = "yes";

       address = [ 
			"192.168.0.100/24"
		];
   	gateway = [ "192.168.0.1" ];
   	dns = [ "9.9.9.9" ];
	};	

	networking.nameservers = [ "9.9.9.9" ];
	services.resolved = {
		enable = true;
		settings.Resolve.Domains = ["~." ];
	};

	networking.useDHCP = true;

	programs.ssh = {
		startAgent = true;
	extraConfig = ''
		AddKeysToAgent yes
	'';
	};

}





#	systemd.network.networks."10-enp3s0-dhcp" = {
#  		matchConfig.Name = "enp3s0"; 
#  		#networkConfig.DHCP = "ipv4"; 
#		address = [
#			"192.168.0.100/24"
#			];
#		routes = [
#		{ Gateway = "192.168.0.1";}
#			];
#		linkConfig.RequiredForOnline = "routable";
#	};
