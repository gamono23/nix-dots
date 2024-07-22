{ _prefs, lib, config, pkgs, ... }:
let
  colorNames = [
    "base00"
    "base01"
    "base02"
    "base03"
    "base04"
    "base05"
    "base06"
    "base07"
    "base08"
    "base09"
    "base0A"
    "base0B"
    "base0C"
    "base0D"
    "base0E"
    "base0F"
  ];

  # Colors used in the markup
  colors = config.lib.stylix.colors.withHashtag;
  secondary = colors.${_prefs.secondaryColor};
  yellow = colors.base0A;
  peach = colors.base09;
  red = colors.base08;
  green = colors.base0B;

  defineColor = name: value: "@define-color ${name} ${value};";

  markup = color: text:
    ''<span color="${color}" style="oblique">${text}</span>'';
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 18 -10 18";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/language"
          "keyboard-state"
          "hyprland/submap"
        ];
        modules-center = [ "clock" ];
        modules-right =
          [ "pulseaudio" "custom/mem" "cpu" "battery" "tray" "custom/wlogout" ];

        "hyprland/workspaces" = { disable-scroll = true; };

        "hyprland/language" = {
          format-en = "US";
          format-ru = "RU";
          min-length = 5;
          tooltip = false;
        };

        "keyboard-state" = {
          capslock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = "";
          };
        };

        "clock" = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format = "{:%a; %d %b, %I:%M %p}";
        };

        "pulseaudio" = {
          reverse-scrolling = 1;
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
          min-length = 13;
        };

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        "custom/wlogout" = {
          format = "{} 󰐥";
          on-click = "exec wlogout";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        tray = {
          icon-size = 16;
          spacing = 0;
        };

      };
    };

    style = lib.strings.concatStringsSep "\n"
      (builtins.map (color: defineColor color colors.${color}) colorNames) + ''
        ${defineColor "primary" colors.${_prefs.primaryColor}}
        ${defineColor "secondary" colors.${_prefs.secondaryColor}}
      '' + ''
        * {
            border: none;
            border-radius: 0;
            font-family: ${config.stylix.fonts.monospace.name};
            font-weight: bold; 
            min-height: 20px;
        }

        window#waybar {
            border-radius: 10px;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        #workspaces {
            margin-right: 16px;
            border-radius: 10px;
            transition: none;
        }

        #workspaces button {
            transition: none;
            background: transparent;
            padding: 5px;
            font-size: 18px;
        }

        #workspaces button.persistent {
            font-size: 12px;
        }

        #workspaces button.active {
            border-radius: inherit;
        }

        #language {
            padding-left: 16px;
            padding-right: 8px;
            border-radius: 10px 0px 0px 10px;
            transition: none;
            background: transparent;
        }

        #keyboard-state {
            margin-right: 8px;
            padding-right: 16px;
            border-radius: 0px 10px 10px 0px;
            transition: none;
            background: transparent;
        }

        #clock {
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            transition: none;
            background: transparent;
        }

        #custom-wlogout {
            padding-right: 16px;
            border-radius: 0px 10px 10px 0px;
            transition: none;
            background: transparent;
        }

        #pulseaudio {
            margin-right: 8px;
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            transition: none;
            background: transparent;
        }

        #pulseaudio.muted {
            background-color: transparent;
        }

        #custom-mem {
            margin-right: 8px;
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            transition: none;
            background: transparent;
        }

        #cpu {
            margin-right: 8px;
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            transition: none;
            background: transparent;
        }

        #tray {
            padding-left: 16px;
            padding-right: 16px;
            border-radius: 10px;
            transition: none;
            background: transparent;
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }
      '';
  };
}
