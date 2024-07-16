{ config, lib, ...}: {
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };

    windowManager.dwm = {
      enable = true;
    };
    
    displayManager = {
      startx.enable = true;
    };
  };
 }
