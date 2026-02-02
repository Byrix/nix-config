{
  programs.wleave = {
    enable = true;

    settings = {
      "margin" = 400;
      "close-on-lost-focus" = true;
      "show-keybinds" = false;
      "no-version-info" = true;
      "column-spacing" = 50;
      "buttons" = [
        {
          "label" = "shutdown";
          "action" = "systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "s";
        }
        {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
        }
        {
          "label" = "lock";
          "action" = "hyprlock";
          "text" = "Lock";
          "keybind" = "l";
        }
      ];
    };

    style = ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(30, 30, 46, 0.9);  /* Base */
      }

      button {
        border-radius: 2rem;
        border-color: rgba(69, 71, 90, 0.9);  /* Surface 1 */
        text-decoration-color: #cdd6f4;  /* Text */
        color: #cdd6f4;  /* Text */
        font-size: 1.5rem;
        background-color: #181825;  /* Mantle */
        border-style: solid;
        border-width: 1px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
      }

      button:focus, button:active, button:hover {
        background-color: #313244;  /* Surface 0 */
        outline-style: none;
      }
    '';
  };
}
