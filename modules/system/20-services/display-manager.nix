{ config, pkgs, ... }:

{
    services.xserver.enable = false;
    services.xserver.displayManager.gdm.enable = false;
    services.xserver.desktopManager.gnome.enable = false;

    services.displayManager.ly = {
      enable = true;
      settings = {
        # allow the display manager to save settings if the program supports it
        load = true;
        save = true;
        # simple clock format (example)
        clock = "%c";
      };
    };

    services.xserver.xkb = {
      # Keep default or paste exact XKB settings here if present in configuration.nix
    };

    # Hyprland (kept in desktop module too)
    programs.hyprland = {
        enable = true;
    };
}

