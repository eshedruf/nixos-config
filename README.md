# NixOS Config

This repository contains NixOS + Home Manager configuration (flake-based).

## Usage

### Update flake inputs (optional)
```bash
nix flake update
```

### Rebuild and switch
```bash
sudo nixos-rebuild switch --flake .#laptop
```
