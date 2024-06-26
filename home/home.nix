{ config, pkgs, pkgs-stable, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";
  home.stateVersion = "23.11";


  # Packages
  home.packages = 
      (with pkgs; [
      ])
      ++
      (with pkgs-stable; [

      ]);





  gtk = {

    enable = true;


    # font = {
    # package = pkgs.;
    # name = "";
    # size = "8";
    # };

    cursorTheme = {
        package = pkgs.bibata-cursors;
        # name = "Bibata-Modern-Classic";
        # name = "Bibata-Original-Classic";
        name = "Bibata-Modern-Ice";
        size = 26;
    };

    theme = {
        package = pkgs.tokyo-night-gtk;
        name = "Tokyo-Night-GTK-Theme";
    };

    iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus Dark";
    };


  };



  qt = {
      enable = true;

      platformTheme = {
          name = "gtk3";
      };

      style = {
          package = pkgs.catppuccin-qt5ct;
          name = "Catppuccin-Mocha";

          # package = pkgs.adwaita-qt;
          # name = "adwaita-dark";
      };

  };






  home.sessionVariables = {
      # ZDOTDIR = "~/.config/zsh";
  };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
      # "helloworld" = {
      #     enable = true;
      #     text = "helloworld!!!!!";
      # };

      # "myfile".source = ./../myfile;


      # ".local/share/zsh/zsh-vi-mode".source = 
      # "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";



      # Keep dotfiles in NixOS dir but link them to ~/.config
      # ".config" = {
      #     enable = false;
      #     recursive = true;
      #     source = ./../dotfiles;
      # };


      # Keep zsh config in NixOS dotfiles dir but also link it to ~/.zshrc
      # ".zshrc" = {
      #     enable = false;
      #     source = ./../dotfiles/zsh/zshrc;
      # };



    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lukas/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };





  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
