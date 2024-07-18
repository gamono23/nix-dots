{ config, inputs, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  users.users.gamono.extraGroups = [ "docker" ];

  networking.hostName = "RyoYamada"; # Define your hostname.

  time.timeZone = "Europe/Moscow"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes
 
  boot.kernelModules = [ "kvm-intel" "i915" ]; 

  services.gvfs.enable = true; # External devices and other disk in file manager 

  system.stateVersion = "24.05"; # Using current system.stateVersion from latest version of NixOS
}
