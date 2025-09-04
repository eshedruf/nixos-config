{ config, pkgs, ... }:

{
    fonts.packages = with pkgs; [
        liberation_ttf
        fira-code
        fira-code-symbols
        (nerd-fonts.fira-code)
        (nerd-fonts.jetbrains-mono)
    ];
}

