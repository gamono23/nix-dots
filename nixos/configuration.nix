{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  # disabledModules = [
  #  ./modules/xserver.nix
  #];

  # nixpkgs.overlays = [ inputs.pollymc.overlay ];

  networking.hostName = "RyoYamada"; # Define your hostname.

  time.timeZone = "Europe/Moscow"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes
  
  services.gvfs.enable = true;  

  system.stateVersion = "24.05"; # Using current system.stateVersion from latest version of NixOS
}
