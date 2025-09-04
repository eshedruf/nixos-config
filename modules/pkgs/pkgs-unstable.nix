{ config, pkgs, ... }:

let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) { inherit (pkgs) system; };
in
{
  nixpkgs.overlays = [
    (final: prev: {
      pkgsUnstable = unstable;
    })
  ];
}

