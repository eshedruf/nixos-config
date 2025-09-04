{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Host-specific overrides
  networking.hostName = "nixos";
  system.stateVersion = "25.05";
}

