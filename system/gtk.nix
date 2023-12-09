{ pkgs, ...}:

{
  gtk = {
    enable = true;
    font.name = "Iosevka";
    theme = {
      name = "SolArc-Dark";
      package = pkgs.solarc-gtk-theme;
      # name = "Catppuccin-Mocha";
      # package = pkgs.catppuccin-gtk.override {
        # accents = ["blue"];
        # size = "compact";
      };
    # };
    iconTheme = {
      name = "Adwaita";
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
