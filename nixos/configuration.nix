# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      # ./packages.nix
    ];



  home-manager = {

      extraSpecialArgs = { inherit inputs; };
      users = {
          lukas = import ../home/home.nix;
      };

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


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
    open = false;

    # Enable NVidia settings menu (nvidia-settings)
    nvidiaSettings = true;

  };



  # Install OpenRGB
  # services.hardware.openrgb.enable = true;




  # Configure keymap in X11
  services.xserver = {
    # Outdated
    # layout = "de";
    # xkbVariant = "";

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

  # Install firefox.
  programs.firefox.enable = true;

  # Install Hyprland
  programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable gamemode
  programs.gamemode.enable = true;

  # Enable zsh
  programs.zsh.enable = true;

  # Enable TMUX
  programs.tmux.enable = true;



  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Generate man page indexing so that apropos and man -k work
  documentation.man.generateCaches = true;


  # Install steam
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;

    # Use gamescope as a microcompositor
    # prepend with: gamescope %command%
    gamescopeSession.enable = false;
  };


fonts.packages = with pkgs; [
        ubuntu_font_family
        jetbrains-mono
        roboto
        roboto-mono
        font-awesome_5
        font-awesome
        roboto-slab
        roboto-serif
        nerdfonts
        hack-font
        iosevka
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
];



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # NixOS
    home-manager

    # Programming
    python3
    libgcc
    gcc
    go
    ruby
    # gcc13
    rocmPackages.llvm.clang
    gnumake
    cmake
    python311Packages.ptpython
    # lua54Packages.luarocks-nix
    luajitPackages.luarocks
    virtualenv
    # python312Packages.pynvim
    luajit
    conda
    lua
    direnv
    luau
    nodejs
    rustc
    cargo
    tree-sitter


    # Wayland
    swww
    waybar
    inotify-tools
    mako
    pyprland
    hyprlock
    wlogout
    gamescope


    # Etc
    mangohud
    protonup  # For Proton GE fork

    # Nvim LSP
    black
    isort
    stylua 


    # Apps
    chromium
    spotify
    vscode
    openrgb
    emacs
    neovide
    nsxiv
    mupdf

    # Fun programs
    neofetch
    cowsay
    figlet
    cmatrix

    # zsh
    # zplug
    # zsh-fast-syntax-highlighting
    # zsh-vi-mode
    # zsh-autosuggestions
    # zsh-autopair
    dash
    rofi-wayland
    lutris
    alacritty
    kitty


    # Terminal images
    ueberzugpp
    libsixel
    lsix

    # Shell tools
    file
    tree
    bat-extras.batman
    starship
    unzip
    fzf
    entr
    xclip
    wl-clipboard
    fd
    ranger
    lf
    neovim
    htop
    btop
    gotop
    eza
    git
    vim
    wget
    ripgrep
    jq
    tldr
    bat
    lm_sensors

  ];

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
