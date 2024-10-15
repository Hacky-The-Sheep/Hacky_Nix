{ pkgs, ... }:

{
    # Fonts
    fonts.packages = with pkgs; [
    	fira-code
    	fira-code-symbols
    	fira-code-nerdfont
     #  intel-one-mono
    	iosevka
      # monaspace
      powerline-fonts
      # source-sans-pro
    ];

    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      fontconfig = {
        antialias = true;
        cache32Bit = true;
        defaultFonts = {
          monospace = [ "iosevka.ttf" ];
          sansSerif = [ "iosevka.ttf" ];
          serif = [ "iosevka.ttf" ];
        };
        hinting.autohint = true;
        hinting.enable = true;
      };
    };
}
