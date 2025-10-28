#network config





{ config, pkgs, lib, ... }:

{
  environment.etc = {
    "resolv.conf".text = "nameserver 192.168.0.101\n";
  };
	networking = {
	  interfaces = {
		enp3s0.ipv4.addresses = [{
		  address = "192.168.0.100";
		  prefixLength = 32;
		}];
	  };
	  defaultGateway = {
		address = "192.168.0.1";
		interface = "enp3s0";
	  };
	};

	programs.ssh = {
		startAgent = true;
	extraConfig = ''
		AddKeysToAgent yes
	'';
	};






}
