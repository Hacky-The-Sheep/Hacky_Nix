{ pkgs, ... }:

# ██       █████  ██████  
# ██      ██   ██ ██   ██ 
# ██      ███████ ██████  
# ██      ██   ██ ██      
# ███████ ██   ██ ██      

{
  imports =
    [
      ../../hosts/laptop/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      ../../hardware/nvidia.nix
      ../../hardware/system76.nix
      ../../hardware/laptop.nix
      ../../system/fonts.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.mullvad-vpn.enable = true;
  services.openssh.enable = true;

  # Fish 🐡
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # GNOME
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.defaultSession = "gnome";

    # KDE
    # displayManager.sddm.enable = true;
    # desktopManager.plasma5.enable = true;
    # displayManager.defaultSession = "plasmawayland";
  };  

  ## Remove Gnome bloat
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    epiphany
  ]);
  services.xserver.libinput.enable = true;
  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  ## Remove KDE bloat
  # environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #   plasma-browser-integration
  #   gwenview
  #   elisa
  # ];

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" ];
    uid = 1000;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    fish
    git
    steam
    discord
    zellij
    home-manager
    nil
    synology-drive-client
    gnomeExtensions.appindicator
    gnome.gnome-boxes
];
 
  # System Version
  system.stateVersion = "23.11";
  
  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}