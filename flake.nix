{
  description = "NixOS + Home Manager configuration (laptop)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    system = "x86_64-linux";
    unstable = nixpkgs-unstable.legacyPackages.${system};

    # Import nixpkgs with overlay that adds pkgsUnstable
  pkgs = import nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;   # 👈 move nixpkgs.config here
    };
    overlays = [
      (final: prev: {
        pkgsUnstable = unstable;
      })
    ];
  };

  in {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./modules/system/00-nix-settings.nix
          ./modules/system/10-boot.nix
          ./modules/system/11-kernel.nix
          ./modules/system/12-networking.nix
          ./modules/system/13-time-i18n.nix
          ./modules/system/20-services/display-manager.nix
          ./modules/system/20-services/printing.nix
          ./modules/system/20-services/audio.nix
          ./modules/system/20-services/ssh-locate.nix
          ./modules/system/30-users.nix
          ./modules/system/40-environment.nix
          ./modules/system/50-packages.nix
          ./modules/system/60-fonts.nix

          ./hosts/laptop/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.eshed = ./hosts/laptop/home.nix;
          }
        ];
      };
    };
  };
}

