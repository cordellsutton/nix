# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

#added for gtx
# 1. Enable unfree packages (required for official Nvidia drivers)
nixpkgs.config.allowUnfree = true;

# 2. Enable OpenGL / Hardware Acceleration
hardware.graphics.enable = true;

# 3. Load the proprietary Nvidia driver
services.xserver.videoDrivers = [ "nvidia" ];

hardware.nvidia = {
  # Modesetting is required for modern Wayland/X11 compositors
  modesetting.enable = true;

  # Power management is recommended to fix suspension/sleep issues
  powerManagement.enable = false;

  # Use the production driver (do NOT set fine-grained 'open' drivers, 
  # as Nvidia's open-source module also drops support for Pascal cards)
  open = false;

  # Select the appropriate driver version (the standard package is fine for a GTX 1070)
  package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
};
#end added for gtx


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

  users.groups.plugdev = {};
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  #hardware.graphics.enable = true;




  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
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

  system.stateVersion = "26.05"; 
  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  services.udev.extraRules = ''
    # RP2040 Bootloader mode (BOOTSEL)
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0003", MODE="0660", GROUP="dialout"
    # RP2040 USB Serial (CDC)
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000a", MODE="0660", GROUP="dialout"
  	SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="0660", GROUP="plugdev"
'';





#virtualization stuff
	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["planimal"];
	virtualisation.libvirtd.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;

}
