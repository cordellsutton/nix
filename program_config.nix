





{ config, pkgs, lib, ... }:

{
	programs.vim.enable = true;
	programs.vim.defaultEditor = true;
	programs.gnupg.agent = {
		enable = true;
		pinentryPackage = pkgs.pinentry-tty;
		};
}
