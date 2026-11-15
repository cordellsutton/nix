{ config, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  
  programs.steam = {
  enable = true;
  };




  environment.systemPackages = with pkgs; [
		ctags
		android-file-transfer
		ollama
		rustc
		kicad
		arduino-cli
		ngspice
		libreoffice
		tree
		opencode
		cargo
		picocom
		gh
		fontconfig 
		gcc-arm-embedded
		stlink
		btop 
		glibc 
		bridge-utils
		wget	
		thunderbird
		nicotine-plus	   
		ffmpeg
		yt-dlp
		vim-full
		terminator
		transmission_4-qt
		rpi-imager 
		man-pages
		libqalculate
		mpv
		gcc
		git
		feh
		pkg-config
		gparted
		nmap
		python3
		bat
		gnumake
		bc
		gdb
		octaveFull
		file
		qemu 
		firefox
		rsync
		ncurses
 ];
}
