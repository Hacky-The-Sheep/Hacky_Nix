{ pkgs, ... }:

{
  # Remove the bloat
  environment.gnome.excludePackages = with pkgs; [
    baobab 
    epiphany
    gedit
    simple-scan
    yelp
    evince
  ];

  # # Add extensions
  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.vitals
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
  ];
}
