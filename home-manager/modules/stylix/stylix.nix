{ pkgs, ... }: {
  stylix = {
    autoEnable = false;
    image = ./wall/wallhaven.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    
    opacity.terminal = 0.75;

    targets = {
      alacritty.enable = true;
      gtk.enable = true;
      helix.enable = true;
      hyprland.enable = true;
      hyprpaper.enable = true;
      mako.enable = true;
      vscode.enable = true;
      waybar = {
        enable = true;
        enableCenterBackColors = true;
        enableLeftBackColors = true;
        enableRightBackColors = true;
      };
      xresources.enable = true;
    };
    
    cursor = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 24;
    };

    fonts = {
      serif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      sansSerif = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      emoji = {
        package = pkgs.twemoji-color-font;
        name = "Twemoji Color Font";
      };
    };
  };
}
