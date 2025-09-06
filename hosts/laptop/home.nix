{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/cli.nix
    ../../modules/home/discord.nix
    ../../modules/home/hyprland/default.nix
    ../../modules/home/neovim.nix
    ../../modules/home/vscode.nix
  ];

  home.username = "eshed";
  home.homeDirectory = "/home/eshed";
  home.stateVersion = "25.05";
}

