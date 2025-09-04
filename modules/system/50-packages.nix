{ pkgs, ... }:

let
  unstable = pkgs.pkgsUnstable;
in
{
  environment.systemPackages = with pkgs; [
        vim
        wget curl
        neovim
        librewolf
        git
        fastfetch
        man
        nmap
        gnupg
        zip unzip
        btop htop
        microsoft-edge
        file
        efibootmgr
        bat
        yazi
        pipewire
        ncdu
        tree
        vscode

        # Hyprland related packages
        firefox                            # browser (works on Wayland; see note)
        kitty                              # terminal (wayland-friendly terminal)
        alacritty
        waybar                             # status bar
        rofi-wayland
        mako                               # notifications
        grim                               # screenshots
        slurp                              # area selection for screenshots
        wl-clipboard                       # clipboard tools (wl-copy, wl-paste)
        pavucontrol                        # sound control GUI (PulseAudio/pipewire)
        pamixer                            # cli audio control
        swaylock                           # lockscreen
        xdg-desktop-portal-hyprland        # portal for screen sharing, file picker (installed by module too)
    
        dunst
        libnotify
        swww

        hyprlock
        hyprsunset
        hyprcursor

        virtualbox

        # unstable (bleeding-edge) packages exposed by the overlay
    	# pkgsUnstable.hyprland
    	# pkgsUnstable.waybar
    ];
}

