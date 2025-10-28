#network config





{ config, pkgs, lib, ... }:

{
	networking.useNetworkd = true;
	systemd.network.enable = true;

	systemd.network.networks."10-enp3s0-dhcp" = {
  		matchConfig.Name = "enp3s0"; 
  		networkConfig.DHCP = "ipv4"; 
		address = [
		#	"192.168.0.100/24"
			];
		routes = [
		{ Gateway = "192.168.0.1";}
			];
		linkConfig.RequiredForOnline = "routable";
	};

	networking.nameservers = [ "192.168.0.101" ];
	services.resolved = {
		enable = true;
		domains = ["~." ];
	};

	networking.useDHCP = false;

	programs.ssh = {
		startAgent = true;
	extraConfig = ''
		AddKeysToAgent yes
	'';
	};






}
