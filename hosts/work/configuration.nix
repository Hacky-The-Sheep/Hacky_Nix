{ pkgs, pkgs-stable, ... }:

# ██     ██  ██████  ██████  ██   ██ 
# ██     ██ ██    ██ ██   ██ ██  ██  
# ██  █  ██ ██    ██ ██████  █████   
# ██ ███ ██ ██    ██ ██   ██ ██  ██  
#  ███ ███   ██████  ██   ██ ██   ██ 

{
  imports =
    [
      ../../hosts/work/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      # ../../hardware/work_nvidia.nix
      ../../system/printers.nix
      ../../system/udev.nix
      ../../hardware/system76.nix
      ../../system/fonts.nix
      ../../system/gnome.nix
      ../../system/language_servers.nix
    ];

  # Needed to run swaylock
  security.pam.services.swaylock = {};

  # Gnome Keyring for Hyprland
  security.pam.services.login.enableGnomeKeyring = true;

  networking.firewall.allowPing = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "jonix";
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
    # libinput.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  programs.dconf.enable = true;

  ## Enable
  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland; 
  };

  # Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  
  ## Open Firewall Ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9090 22 80 46745 ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # alsa.enable = true;
    # alsa.support32Bit = true;
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
    cargo
    delve
    discord
    fish
    git
    home-manager
    go
    makemkv
    microsoft-edge-dev
    nil
    steam
    synology-drive-client
    vim
    wget
    wineWowPackages.stable
    zellij
    ])

  ++

  (with pkgs; [
    simplex-chat-desktop
    xmrig
    cudaPackages.cudatoolkit
  ]);

  # System Version
  system.stateVersion = "24.05";

  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Enable MSR Mod
  hardware.cpu.x86.msr.enable = true;

  #TEST ---> DELETE IF NOT WORKING
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
}
