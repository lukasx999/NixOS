{ inputs, config, pkgs, ... }:

{

  fonts.packages = with pkgs; [
    comic-mono
    inconsolata-nerdfont
    inconsolata
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


}
