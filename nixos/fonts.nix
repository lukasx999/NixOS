{ inputs, config, pkgs, ... }:

{

  fonts.packages = with pkgs; [
    comic-mono
    inconsolata-nerdfont
    inconsolata
    ubuntu_font_family
    jetbrains-mono
    terminus-nerdfont
    roboto
    roboto-mono
    roboto-slab
    roboto-serif
    font-awesome_5
    font-awesome_4
    font-awesome
    nerdfonts
    hack-font
    iosevka
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-nerdfont
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];


}
