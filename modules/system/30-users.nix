{ config, pkgs, ... }:

{
    users.users = {
        eshed = {
            isNormalUser = true;
            description = "eshed";
            extraGroups = [ "networkmanager" "wheel" ];
            packages = with pkgs; [
              # your user packages listed in original configuration.nix under users.users.eshed.packages
            ];
        };
    };
}

