{ pkgs, ... }:

{
  # Add Gnome bloat
  environment.systemPackages = with pkgs; [

    # Core Gnome
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.wallpaper-slideshow
    gnomeExtensions.sound-output-device-chooser

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
