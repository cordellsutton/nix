//network config





{ config, pkgs, lib, ... }:

{
  environment.etc = {
    "resolv.conf".text = "nameserver 192.168.0.101\n";
  };


	programs.ssh = {
		startAgent = true;
	extraConfig = ''
		AddKeysToAgent yes
	'';
	};






}
