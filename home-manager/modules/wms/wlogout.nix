{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      * {
      	background-image: none;
      	box-shadow: none;
      }

      window {
      	background-color: #2e3440;
      }

      button {
        margin: 25px;
        border-radius: 30px;
      	text-decoration-color: #eceff4;
        color: #eceff4;
      	background-color: #3b4252;
      }

      button:focus, button:active, button:hover {
      	background-color: #4c566a;
      	outline-style: none;
      }
    '';
  };
}
