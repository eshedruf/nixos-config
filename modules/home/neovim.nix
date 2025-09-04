{ pkgs, ... }:

{
  programs.neovim = {
    enable = false; # keep false if you manage neovim via system package + dotfiles
  };
}

