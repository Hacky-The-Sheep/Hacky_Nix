{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      ei = "exit";
      tt = "tmux new";
      rtv = "rtv --enable-media";
      bb = "cd -";
      rfo = "rm -rf";
      vrc = "vi ~/.config/nvim/init.vim";
      python = "python3";
      nb = "newsboat";
      cat = "bat";
      ga = "git add";
      gs = "git status";
      gc = "git commit -m";
      yty = "yt-dlp -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' ";
      ytu = "yt-dlp -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s'";
      ydl = "yt-dlp --prefer-ffmpeg --merge-output-format mkv ";
      ymp4 = "yt-dlp --prefer-ffmpeg --merge-output-format mp4 ";
      ymp3 = "yt-dlp --extract-audio --audio-format mp3 ";
      la = "exa -a --color =always --group-directories-first --icons,";
      rmark = "ssh root@10.11.99.1";
      gotti = "mpv https://www.twitch.tv/tugotti78";
      mami = "mpv https://www.twitch.tv/donscaremami";
      screens = "rm -f Pictures/Screenshots/*";
      code = "cd ~/ExtraDrive/Coding";
      cpy = "cd ~/ExtraDrive/Coding/Python/";
      crst = "cd ~/ExtraDrive/Coding/rust/";
      cpr = "cd ~/ExtraDrive/Projects/";
      kb = "cd ~/Documents/PKM/";
      zj = "zellij";
      hmu = "home-manager switch --flake .";
      nup = "sudo nixos-rebuild switch --flake .";
    };
  };
}
