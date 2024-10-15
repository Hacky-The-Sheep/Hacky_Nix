{
  programs.nushell = {
    enable = true;

    # Aliases
    shellAliases = {
      # General
      ll = "ls -l";
      ei = "exit";
      zj = "zellij";

      # Git
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";

      #YouTubeDLP
      yty = "yt-dlp -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ";
      ytu = "yt-dlp -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s'";
      ydl = "yt-dlp --prefer-ffmpeg --merge-output-format mkv ";
      ymp4 = "yt-dlp --prefer-ffmpeg --merge-output-format mp4 ";
      ymp3 = "yt-dlp --extract-audio --audio-format mp3 ";

      # Nix Stuff
      gecon = "nix-store --gc";
    };

    # Config
    extraConfig = ''
      $env.config = {
        show_banner: false,
        completions: {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"
        }
      }
    '';
  };
}
