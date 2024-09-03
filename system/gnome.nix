{ pkgs, ... }:

{
  # Add Gnome bloat
  environment.systemPackages = with pkgs; [

    # Core Gnome
    gnome-tweaks
    gnome-browser-connector
    gnomeExtensions.appindicator

    # Gnome Circle
    blanket
    emblem
    fragments
    polari
    shortwave
    video-trimmer
  ];

  # Remove the bloat
  environment.gnome.excludePackages = with pkgs; [
    baobab 
    epiphany
    gedit
    simple-scan
    yelp
    evince
  ];
}
