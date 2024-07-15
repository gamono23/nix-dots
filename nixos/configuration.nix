{ config, inputs, pkgs, ...}: {
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
 
  boot.kernelModules = [ "kvm-intel" "i915" "vfio" "vfio_iommu_type1" "vfio_pci" "vfio-virqfd" ]; 


  services.gvfs.enable = true; # External devices and other disk in file manager 
  
  services.flatpak.enable = true; # Flathub is based on flatpak
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  # ^ Flatpak is this hungry...

  system.stateVersion = "24.05"; # Using current system.stateVersion from latest version of NixOS
}
