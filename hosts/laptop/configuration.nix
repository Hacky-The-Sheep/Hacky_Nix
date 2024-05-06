{ pkgs, pkgs-unstable, ... }:

# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝
# ███████║██║   ██║██╔████╔██║█████╗  
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

{
  imports =
    [
      ../../hosts/laptop/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      ../../system/fonts.nix
      ../../system/udev.nix
      ../../system/gnome.nix
      ../../system/language_servers.nix
    ];
  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Networking
  networking.hostName = "nixworks";
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
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  programs.dconf.enable = true;

  ## Open Firewall Ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9090 22 80 ];
  };

  services.xserver.libinput.enable = true;

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" "plugdev"];
    uid = 1000;
  };

  users.users.monkey = {
    isNormalUser = true;
    description = "monkey";
    home = "/home/monkey";
  };

  nix.settings.trusted-users = [ "root" "@wheel"];

  environment.systemPackages = 
  ( with pkgs; [
    cargo
    delve
    git
    home-manager
    go
    gnomeExtensions.app-icons-taskbar
    nil
    rustc
    synology-drive-client
    vim
    wget
    zellij
  ])

  ++

  (with pkgs-unstable; [
    simplex-chat-desktop
    helix
  ]);
 
  # System Version
  system.stateVersion = "23.11";
  
  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
