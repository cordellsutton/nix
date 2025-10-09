{ config, pkgs, ... }:

{



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   librewolf
   vim
   terminator
   transmission_4-qt
   neofetch
   scrot
   kdePackages.okular
   libreoffice-qt6-fresh
   kdePackages.spectacle
   man-pages
   dig
   qemu
   libvirt
   virglrenderer
   libqalculate
   mpv
   gcc
   home-manager
   git
   feh
   pkg-config
   gparted
   nmap
   mdadm
   kicad
   ghidra
   freecad
   python3
   bat
   tinycc
   gnumake
   bc
   gdb
   octave
   gnuplot
   ];
}
