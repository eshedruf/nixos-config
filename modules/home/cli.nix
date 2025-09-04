{ pkgs, ... }:

{
  home.username = "eshed";
  home.homeDirectory = "/home/eshed";
  home.stateVersion = "25.05";

  # CLI tools to install for the user
  home.packages = with pkgs; [
    # add CLI-only packages here (e.g. fzf, fd)
  ];
}

