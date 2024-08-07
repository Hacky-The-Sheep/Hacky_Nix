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
      ../../hosts/laptop/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      ../../system/fonts.nix
      ../../system/udev.nix
      ../../system/language_servers.nix
    ];
  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Framework
  services.fwupd.enable = true;
  
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Networking
  networking.hostName = "nixworks";
  networking.networkmanager.enable = true;
  services.mullvad-vpn.enable = true;
  services.openssh.enable = true;

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs-stable.brlaser ];
  
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
  };

  # Plasma6
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
  };
    

  programs.dconf.enable = true;

  ## Open Firewall Ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9090 22 80 ];
  };

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" "plugdev"];
    uid = 1000;
  };

  nix.settings.trusted-users = [ "root" "@wheel"];

  environment.systemPackages = 
  ( with pkgs; [
    cargo
    delve
    git
    go
    helix
    home-manager
    nil
    rustc
    simplex-chat-desktop
    synology-drive-client
    tracker
    vim
    wget
    zellij
  ]);
 
  # System Version
  system.stateVersion = "24.05";
  
  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  catppuccin.flavor = "mocha";
}
