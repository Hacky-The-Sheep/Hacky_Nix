{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin-mocha";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        auto-format = true;
      };
      editor.statusline = {
        left = [ "mode" "spinner" "read-only-indicator" "file-modification-indicator"];
        center = [ "file-name" ];
        right = [ "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
        mode.normal = "NORMAL 🐧";
        mode.insert = "INSERT 🚀";
        mode.select = "SELECT  👆";
      };
      editor.cursor-shape = {
        insert = "bar";
        select = "underline";
      };
      editor.indent-guides = {
        render = true;
      };
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection"];
        C-space = "signature_help";
        X = "extend_line_up";
      };
      keys.normal.space = {
        w = ":write";
        q = ":quit";
        b = ":buffer-close";
      };
    };
    languages = {
      language = [{
        name = "python";
        scope = "source.python";
        injection-regex = "python" ;
        file-types = ["py" "pyi" "py3" "pyw" ".pythonstartup" ".pythonrc"];
        shebangs = ["python"] ;
        roots = ["." "pyproject.toml" "pyrightconfig.json"];
        comment-token = "#" ;
        language-servers = ["pyright" "ruff" "pylsp"];
        auto-format = true;
    }];
  };
  themes = {
    catppuccin-mocha = let
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
      cursorline = "#2a2b3c";
      secondary_cursor = "#b5a6a8";
    in {
      "type" = yellow;
      "constructor" = sapphire;
      "constant" = peach;
      "constant.builtin" = peach;
      "constant.character" = teal;
      "constant.character.escape" = pink;
      "ui.menu.selected" = {
        modifiers = [ "reversed" ];
      };
      "ui.selection" = {
        fg = mantle;
        bg = blue;
      };
      "string" = green;
      "string.regexp" = peach;
      "string.special" = blue;
      "variable" = text;
      "variable.builtin" = red;
      "variable.other.member" = teal;
      "label" = sapphire;
      "punctuation" = overlay2;
      "punctuation.special" = sky;
      "keyword" = mauve;
      "operator" = sky;
      "function" = blue;
      "function.macro" = mauve;
      "tag" = mauve;
      "attribute" = blue;
      "special" = blue;
      "markup.heading.1" = lavender;
      "markup.heading.2" = mauve;
      "markup.heading.3" = green;
      "markup.heading.4" = yellow;
      "markup.heading.5" = pink;
      "markup.heading.6" = teal;
      "markup.list" = mauve;
      "markup.link.text" = blue;
      "markup.raw" = flamingo;
      "diff.plus" = green;
      "diff.minus" = red;
      "diff.delta" = blue;
      error = red;
      warning = yellow;
      info = sky;
      hint = teal;
    };
  };
 };
}