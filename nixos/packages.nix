{ inputs, config, lib, pkgs, pkgs-stable, ...}:

{


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =


  # Unstable packages
  (with pkgs; [

    # Temp
    dwt1-shell-color-scripts
    i2c-tools
    wineWowPackages.stable

    # NixOS
    home-manager
    nh  # Nix Helper
    nix-output-monitor
    nvd  # Diff Viewer

    # Programming

    python311Packages.pip
    python311Packages.pyside6
    python311Packages.selenium
    python311Packages.icecream

    platformio-core
    python3
    libgcc
    gcc
    go
    ruby
    ghc
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
    gimp
    libreoffice
    discord
    vscodium
    chromium
    spotify
    vscode
    # openrgb
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
    htop
    btop
    gotop
    eza
    git
    wget
    ripgrep
    jq
    tldr
    bat
    lm_sensors
    vim
    # neovim
    # neovim-gtk



  ])

++

(with pkgs-stable; [

neovim


]);

}
