{ pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;

    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };

    image = ./wall/wallhaven.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";

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
