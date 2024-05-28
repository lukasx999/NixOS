# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, pkgs-stable, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager

      # inputs.nix-flatpak.nixosModules.nix-flatpak  # Importing flatpak module

      ./packages.nix
      ./fonts.nix
    ];





  home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users = {
          lukas = import ../home/home.nix;
      };
  };



  environment.sessionVariables = {
      FLAKE = "/home/lukas/NixOS";
  };




  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lukdt"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;




  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };




services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable startx as a pseudo display manager
    displayManager.startx.enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.gnome.enable = true;
    desktopManager.gnome.debug = true;


    # Enable Qtile
    windowManager.qtile.enable = true;
};






  # Install picom
  services.picom.enable = true;


  # Install Hyprland
  programs.hyprland = {
      enable = true;
      # package = pkgs-stable.hyprland;
      package = pkgs.hyprland;
      xwayland.enable = true;
  };
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";







  # Bluetooth support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;


  services.flatpak.enable = true;



  # Redshift
  location.provider = "geoclue2";
  # All values except 'enable' are optional.
  services.redshift = {
    enable = true;
    brightness = {
      # Note the string values below.
      day = "1";
      night = "1";
    };
    temperature = {
      day = 5700;  # 5500
      night = 4500;  # 3700
    };
    };






  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  # Enable proprietary NVidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    modesetting.enable = true;
    powerManagement.enable = false;

    powerManagement.finegrained = false;

    # Uses the NVidia open source kernel module
    open = true;

    # Enable NVidia settings menu (nvidia-settings)
    nvidiaSettings = true;

  };



  # Install OpenRGB
  services.hardware.openrgb = {
      enable = true;
      motherboard = "intel";
  };
  hardware.i2c.enable = true;
  services.udev.extraRules = (builtins.readFile "${pkgs.openrgb}/lib/udev/rules.d/60-openrgb.rules");




  # Configure keymap in X11
  services.xserver = {
    autoRepeatDelay = 300;
    autoRepeatInterval = 50;

    xkb = {
        variant = "";
        layout = "de";
    };
  };

  # Configure console keymap
  console.keyMap = "de";

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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lukas = {

    isNormalUser = true;
    description = "lukas";
    extraGroups = [ "networkmanager" "wheel" ];

    shell = pkgs.zsh;

    packages = with pkgs; [
    #  thunderbird
    ];
  };



  # Flatpaks
  # services.flatpak.enable = true;


  # Install firefox.
  programs.firefox.enable = true;

  # Enable gamemode
  programs.gamemode.enable = true;

  # Enable zsh
  programs.zsh.enable = true;

  # Enable TMUX
  programs.tmux.enable = true;



  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Generate man page indexing so that apropos and man -k work
  documentation = {
      enable = true;
      man.generateCaches = true;

      dev.enable = true;
      man.enable = true;
      doc.enable = true;
      info.enable = true;
      nixos.enable = true;
  };


  # Install steam
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;

    # Use gamescope as a microcompositor
    # prepend with: gamescope %command%
    gamescopeSession.enable = false;
  };





  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.11";

}
