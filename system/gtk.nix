{ pkgs, ...}:

# let
#   catppuccin_name = "Catppuccin-Mocha-Standard-Sky-Dark";
#   catppuccin = pkgs.catppuccin-gtk.override {
#     accents = [ "sky" ];
#     size = "standard";
#     tweaks = [ "normal" ];
#     variant = "mocha";
#   };

# in
#   {
#     gtk = {
#       enable = true;
#       theme = {
#         name = catppuccin_name;
#         package = catppuccin;
#       };
#       cursorTheme = {
#         name = "Catppuccin-Mocha-Dark-Cursors";
#         package = pkgs.catppuccin-cursors.mochaDark;
#       };
#     };
#       home.file.".config/gtk-4.0/gtk.css".source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/gtk.css";
#       home.file.".config/gtk-4.0/gtk-dark.css".source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/gtk-dark.css";

#       home.file.".config/gtk-4.0/assets" = {
#         recursive = true;
#         source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/assets";
#     };

#    home.sessionVariables.GTK_THEME = "Catppuccin-Mocha-Standard-Sky-Dark";
# }

{
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      size = "compact";
      accent = "peach";
      cursor = {
        enable = true;
        accent = "dark";
      };
    };
  };
}
