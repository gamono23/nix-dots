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
    figma-linux
    redlib
    qbittorrent
    pragha
    fooyin
    sayonara
    vscode

    # Coding stuff
    gnumake
    gcc
    clang
    nodejs
    python
    helix
    nixfmt
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
    ffmpeg
    zip
    ntfs3g
    swww
    openssl
    lazygit
    bluez
    bluez-tools
    nnn

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    gromit-mpx
    lxqt.lxqt-policykit
    
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
    nordzy-icon-theme
    nordzy-cursor-theme
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
