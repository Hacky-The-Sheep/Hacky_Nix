{ pkgs, pkgs-stable, inputs, hostname, ... }:

{
  imports =
    [
      hardware/bluetooth.nix
      system/fonts.nix
      system/gnome.nix
      system/language_servers.nix
      system/printers.nix
      system/udev.nix
    ];

  # Hyprland
  security.pam.services = {
    login.enableGnomeKeyring = true;
  };
  programs.hyprlock.enable = true;

  networking.firewall.allowPing = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Fish 🐡
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.dconf.enable = true;

  # Enable
   programs.hyprland = {
     enable = true;
     package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
   };

   # Cachix
   nix.settings = {
     substituters = ["https://hyprland.cachix.org"];
     trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
   };

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser pkgs.cups-toshiba-estudio ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  
  ## Open Firewall Ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9090 22 80 46745 9091 ];
    allowedUDPPorts = [ 7236 5353 ];
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "dialout" "libvirtd"];
    uid = 1000;
  };

  environment.systemPackages = 
  (with pkgs-stable; [

    # General Purpose
    age
    alacritty
    fastfetch
    fish
    git
    home-manager
    kitty
    librewolf
    sops
    synology-drive-client
    vim
    wget
    zellij

    # Coding
    cargo
    delve
    go
    nil

    # Entertainment
    audacious
    mpv
    vlc
    
    # Hyprland    
    brightnessctl
    dunst
    grim
    hyprlock
    polkit_gnome
    rofi
    rofimoji
    slurp
    swappy
    swww

    # Pentesting
    ffuf
    gobuster
    john
    nmap
    rlwrap
    thc-hydra

    # Terminal Programs
    eza
    helix
    htop
    openvpn
    ripgrep
    yt-dlp

    # Work Stuff
    libreoffice
    obsidian
    putty
    remmina
    sshs
    wireshark
    ])

  ++

  (with pkgs; [
    brave
    powershell
    simplex-chat-desktop
  ]);

  # System Version
  system.stateVersion = "24.05";

  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Clean Nix
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  
  # Catppuccin
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "peach";
  };
}
