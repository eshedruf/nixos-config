{ config, pkgs, ... }:

{
    services.openssh.enable = true;
    services.locate.enable = true;
}

