{ config, pkgs, ... }:

{
    # Bootloader.
    boot.loader = {
        timeout = 30;

        efi = {
            efiSysMountPoint = "/boot";  # Make sure this is the ESP
            canTouchEfiVariables = true;
        };

        systemd-boot.enable = false;    # Disable systemd-boot entirely

        grub = {
            enable = true;
            efiSupport = true;
            efiInstallAsRemovable = false; # No fallback
            devices = [ "nodev" ];
            useOSProber = true;
            extraEntriesBeforeNixOS = false;
            configurationName = "generation";
        };
    };
}

