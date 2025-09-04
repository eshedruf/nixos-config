{ config, pkgs, ... }:

{
    environment.sessionVariables = {
        # if cursor becomes invisible
        WLR_NO_HARDWARE_CURSORS = "1";
    };
}

