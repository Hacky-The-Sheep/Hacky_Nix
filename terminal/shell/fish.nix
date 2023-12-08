{
  programs.fish = {
    enable = true;
    shellAliases = {
      ei = "exit";
      python = "python3";
      nb = "newsboat";
      cat = "bat";

      # Git
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";

      # YoutubeDL
      yty = "yt-dlp -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ";
      ytu = "yt-dlp -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s'";
      ydl = "yt-dlp --prefer-ffmpeg --merge-output-format mkv ";
      ymp4 = "yt-dlp --prefer-ffmpeg --merge-output-format mp4 ";
      ymp3 = "yt-dlp --extract-audio --audio-format mp3 ";
      ls = "exa -a --color --icons --long";
      zj = "zellij";

      # NixOS ❄
      hmu = "home-manager switch --flake .";
      nup = "sudo nixos-rebuild switch --flake .";
      up = "nixos-rebuild switch --upgrade";
    };
  };
}
