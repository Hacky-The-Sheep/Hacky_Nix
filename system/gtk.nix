{ pkgs, ...}:

{
  gtk = {
    enable = true;
    font.name = "Iosevka";
    theme = {
      name = "Catppuccin-Mocha";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme = 1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme = 1
      '';
    };
  };
}
