{ pkgs, ...}: {
    stylix = {
        image = ./wall/wallhaven.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
        targets = {
            alacritty.enable = true;
            gtk.enable = true;
            helix.enable = true;
            hyprland.enable = true;
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
    };
}