{ pkgs, ...}:

{
  gtk = {
    enable = true;
    font.name = "Iosevka";
    theme = {
      name = "Catppuccin-Mocha-Standard-Sky-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        tweaks = [ "rimless" "black"];
        variant = "mocha";
      };
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Standard-Sky-Dark";
    };
  };

  home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Sky-Dark";

}
