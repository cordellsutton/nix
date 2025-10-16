





{ config, pkgs, lib, ... }:

{
#network
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false
  #networking.hosts = {
  #     "192.168.0.101:8000" = ["home.paperless.com"];
  # };

  environment.etc = {
    "resolv.conf".text = "nameserver 192.168.0.101\n";
  };

}
