# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "seras"; 
  networking.networkmanager.enable = false;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  hardware.graphics.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  users.groups = [ "plugdev" ];
  users.users.planimal = {
    isNormalUser = true;
    description = "planimal";
    extraGroups = [ "wheel" "nixbld" "dialout" "plugdev"];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  fonts.packages = with pkgs; [
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-color-emoji
	liberation_ttf
	fira-code
	fira-code-symbols
	mplus-outline-fonts.githubRelease
	dina-font
	proggyfonts
	nerd-fonts.fira-code
  	nerd-fonts.droid-sans-mono	
	];
	#these both seem needed to get fonts to render properly in terminator?
  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.fontconfig.antialias = true;

  system.stateVersion = "25.05"; 
  nix.settings.experimental-features = ["nix-command" "flakes"];



#virtualization stuff
	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["planimal"];
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;
	

}
