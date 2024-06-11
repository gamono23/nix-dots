{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    telegram-desktop
    alacritty
    obs-studio
    wofi
    mpv
    gparted
    pcmanfm-qt
    xfce.thunar
    figma-linux
    #  pollymc

    # Coding stuff
    gnumake
    gcc
    clang
    nodejs
    python
    (python3.withPackages (ps: with ps; [ requests ]))

    # CLI utils
    neofetch
    file
    tree
    wget
    git
    fastfetch
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    zram-generator
    cava
    zip
    ntfs3g
    swww
    openssl
    lazygit
    bluez
    bluez-tools
    neovim

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx
    kdePackages.polkit-kde-agent-1

    # Wayland stuff
    wl-clipboard
    cliphist

    # WMs and stuff
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    waybar

    # Sound
    pipewire
    pavucontrol

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Other
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "Inconsolata" ]; })
  ];
}
