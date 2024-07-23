{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    firefox
    telegram-desktop
    obs-studio
    mpv
    gparted
    pcmanfm
    redlib
    qbittorrent
    fooyin
    vscode
    steam
    gamescope

    # Coding stuff
    gnumake
    gcc
    clang
    cmake
    nodejs
    python
    nixfmt-classic
    (python3.withPackages (ps: with ps; [ requests ]))
    poetry
    tmux

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
    ffmpeg-full
    yt-dlp
    zip
    ntfs3g
    openssl
    lazygit
    bluez
    bluez-tools
    nnn

    # GUI utils
    feh
    imv
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
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    nvidia-vaapi-driver
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
