{ pkgs, pkgs-stable, ... }:

# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝
# ███████║██║   ██║██╔████╔██║█████╗  
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

{
  imports =
    [
      ../../hosts/home/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      ../../hardware/system76.nix
      ../../system/fonts.nix
      ../../system/udev.nix
      ../../system/gnome.nix
      ../../system/language_servers.nix
    ];

  # Needed to run swaylock
  security.pam.services.swaylock = {};

  # Hyprland
  security.pam.services.login.enableGnomeKeyring = true;
  programs.hyprland.enable = true;
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
    
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Networking
  networking.hostName = "homenix";
  networking.networkmanager.enable = true;
  services.mullvad-vpn.enable = true;
  services.openssh.enable = true;

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
  
  # Fish 🐡
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  
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
  # Gnome
  services.xserver = {
    enable = true;
    # libinput.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  # services.libinput.enable = true;

  programs.dconf.enable = true;
  
  ## Open Firewall Ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9090 22 80 ];
  };

  services.libinput.enable = true;

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "dialout"];
    uid = 1000;
  };

  users.users.monkey = {
    isNormalUser = true;
    description = "monkey";
    home = "/home/monkey";
  };

  # Partition Manager
  services.dbus.packages = [pkgs.libsForQt5.kpmcore];

  nix.settings.trusted-users = [ "root" "@wheel"];

  environment.systemPackages = 
  ( with pkgs-stable; [
    cargo
    delve
    fish
    git
    home-manager
    go
    nil
    rustc
    synology-drive-client
    vim
    wget
    zellij
  ])

  ++

  (with pkgs; [
    goreleaser
    mullvad-vpn
    obsidian
    simplex-chat-desktop
  ]);
 
  # System Version
  system.stateVersion = "24.05";
  
  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
