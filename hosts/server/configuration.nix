{ config, pkgs, ... }:

# ███████ ███████ ██████  ██    ██ ███████ ██████  
# ██      ██      ██   ██ ██    ██ ██      ██   ██ 
# ███████ █████   ██████  ██    ██ █████   ██████  
#      ██ ██      ██   ██  ██  ██  ██      ██   ██ 
# ███████ ███████ ██   ██   ████   ███████ ██   ██ 
                                                 
{
  imports =
    [
      # ../../hosts/server/hardware-configuration.nix
      # ./hardware/bluetooth.nix
      # ./hardware/nvidia.nix
      ../../system/fonts.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # services.mullvad-vpn.enable = true;

  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };

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
    displayManager.defaultSession = "gnome";
  };  

  # Cachix
  # nix.settings = {
  #   substituters = ["https://hyprland.cachix.org"];
  #   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  # };

  # Remove Gnome bloat
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    epiphany
  ]);

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver.libinput.enable = true;
  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

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
    home-manager
    # steam
    # discord
    zellij
    nil
    # synology-drive-client
    gnomeExtensions.appindicator
];

  # System Version
  system.stateVersion = "24.05";

  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
