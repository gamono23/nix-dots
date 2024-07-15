{ config, lib, ...}: {
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };

    displayManager = {
      startx.enable = true;
    };
  };
 }
