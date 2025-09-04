{ config, pkgs, ... }:

{
    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.kernelModules = [ "bluetooth" "btusb" ];
}

