{ pkgs, inputs, ... }:

# ██       █████  ██████  
# ██      ██   ██ ██   ██ 
# ██      ███████ ██████  
# ██      ██   ██ ██      
# ███████ ██   ██ ██      

{
  imports =
    [
      ../../hosts/nvid_laptop/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      # ../../hardware/nvidia.nix
      ../../hardware/system76.nix
      ../../hardware/laptop.nix
      ../../system/fonts.nix
      ../../system/printers.nix
      ../../system/gnome.nix
      ../../users/home/users.nix

      # Gaming
      ../../apps/games.nix
    ];

  # Needed to run swaylock
  security.pam.services.swaylock = {};
  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

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

  # Hyprland
  
  ## Enable
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland; 
  };
  
  ## Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

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
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.dconf.enable = true;

  services.xserver.libinput.enable = true;

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" ];
    uid = 1000;
  };

  environment.systemPackages = with pkgs; [
    cargo
    catppuccin-gtk
    delve
    discord
    git
    go
    gopls
    home-manager
    networkmanager
    networkmanagerapplet
    nil
    python311Packages.python-lsp-server
    rust-analyzer
    rustc
    synology-drive-client
    vim
    vscode-langservers-extracted
    wget
];
 
  # System Version
  system.stateVersion = "23.11";
  
  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
