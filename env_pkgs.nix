{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   nicotine-plus	   
   ffmpeg
   usbutils
   yt-dlp
   inetutils	
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
   file
   gnupg
   pinentry-tty
   texliveTeTeX
   go
   minicom
   qemu 
   ];
}
