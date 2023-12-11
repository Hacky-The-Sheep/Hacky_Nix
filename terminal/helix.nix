{ config, ...}:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      # theme = "catppuccin-mocha";
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
    base-16 = let
      base00 = "#${config.colorScheme.colors.base00}"; 
      base01 = "#${config.colorScheme.colors.base01}"; 
      base02 = "#${config.colorScheme.colors.base02}"; 
      base03 = "#${config.colorScheme.colors.base03}"; 
      base04 = "#${config.colorScheme.colors.base04}"; 
      base05 = "#${config.colorScheme.colors.base05}";
      base06 = "#${config.colorScheme.colors.base06}"; 
      base07 = "#${config.colorScheme.colors.base07}";
      base08 = "#${config.colorScheme.colors.base08}";
      base09 = "#${config.colorScheme.colors.base09}";
      base0A = "#${config.colorScheme.colors.base0A}";
      base0B = "#${config.colorScheme.colors.base0B}";
      base0C = "#${config.colorScheme.colors.base0C}";
      base0D = "#${config.colorScheme.colors.base0D}"; 
      base0E = "#${config.colorScheme.colors.base0E}";
      base0F = "#${config.colorScheme.colors.base0F}";

    in {

      ## --- Syntax Highligthing ---##
      "type" = base0A;

      "constructor" = base0D;

      "constant" = base09;
      "constant.builtin" = base09;
      "constant.character" = base0C;
      "constant.character.escape" = base0F;

      "string" = base0B;
      "string.regexp" = base09;
      "string.special" = base0D;

      "comment" = {
        fg = base07;
        modifiers = [ "italic" ];
      };

      "variable" = base05;
      "variable.parameter" = {
        fg = base09;
        modifiers = [ "italic" ];
      };
      "variable.builtin" = base08;
      "variable.other.member" = base0C;

      "label" = base0C;

      "punctuation" = base02;
      "punctuation.special" = base0D;

      "keyword" = base0E;
      "keyword.control.conditional1" = {
        fg = base0E;
        modifiers = [ "italic" ];
      };

      "operator" = base0D;

      "function" = base0D;
      "function.macro" = base0E;

      "tag" = base0E;
      "attribute" = base0D;

      "namespace" = {
        fg = base0D;
        modifiers = [ "italic" ];
      };

      "special" = base0D;
      "markup.heading.marker" = { 
        fg = base09; 
        modifiers = ["bold"];
      };
      "markup.heading.1" = base07;
      "markup.heading.2" = base0E;
      "markup.heading.3" = base0B;
      "markup.heading.4" = base0A;
      "markup.heading.5" = base0F;
      "markup.heading.6" = base0C;
      "markup.list" = base0E;
      "markup.bold" = { modifiers = ["bold"]; };
      "markup.italic" = { modifiers = ["italic"]; };
      "markup.link.url" = { fg = base0D; modifiers = ["italic" "underlined"]; };
      "markup.link.text" = base0D;
      "markup.raw" = base0F;

      "diff.plus" = base0B;
      "diff.minus" = base08;
      "diff.delta" = base0D;

      ##--- User Interface ---##

      "ui.background" = {
        fg = base05; 
        bg = base00;
      };

      "ui.linenr" = { fg = base03; };
      "ui.linenr.selected" = { fg = base07; };

      "ui.statusline" = { fg = base05; bg = base04; };
      "ui.statusline.inactive" = { fg = base04; bg = base04; };
      "ui.statusline.normal" = { fg = base00; bg = base07; modifiers = ["bold"]; };
      "ui.statusline.insert" = { fg = base00; bg = base0B; modifiers = ["bold"]; };
      "ui.statusline.select" = { fg = base00; bg = base0F; modifiers = ["bold"]; };

      "ui.popup" = { fg = base05; bg = base02; };
      "ui.window" = { fg = base01; };
      "ui.help" = { fg = base05; bg = base02; };

      "ui.bufferline" = { fg = "subtext0"; bg = base04; };
      "ui.bufferline.active" = { fg = base0E; bg = base00; underline = { color = base0E; style = "line"; }; };
      "ui.bufferline.background" = { bg = base01; };

      "ui.text" = base05;
      "ui.text.focus" = { fg = base05; bg = base02; modifiers = ["bold"]; };
      "ui.text.inactive" = { fg = base03; };

      "ui.virtual" = base04;
      "ui.virtual.ruler" = { bg = base02; };
      "ui.virtual.indent-guide" = base02;
      "ui.virtual.inlay-hint" = { fg = base03; bg = base04; };

      "ui.selection" = { bg = base03; };

      "ui.cursor" = { fg = base00; bg = "secondary_cursor"; };
      "ui.cursor.primary" = { fg = base00; bg = base0F; };
      "ui.cursor.match" = { fg = base09; modifiers = ["bold"]; };

      "ui.cursor.primary.normal" = { fg = base00; bg = base07; };
      "ui.cursor.primary.insert" = { fg = base00; bg = base0B; };
      "ui.cursor.primary.select" = { fg = base00; bg = base0F; };

      "ui.cursor.normal" = { fg = base00; bg = "secondary_cursor_normal"; };
      "ui.cursor.insert" = { fg = base00; bg = "secondary_cursor_insert"; };
      "ui.cursor.select" = { fg = base00; bg = "secondary_cursor"; };

      "ui.cursorline.primary" = { bg = base04; };

      "ui.highlight" = { bg = base03; modifiers = ["bold"]; };

      "ui.menu" = { fg = base05; bg = base02; };
      "ui.menu.selected" = { fg = base05; bg = base03; modifiers = ["bold"]; };

      "diagnostic.error" = { underline = { color = base08; style = "curl"; }; };
      "diagnostic.warning" = { underline = { color = base0A; style = "curl"; }; };
      "diagnostic.info" = { underline = { color = base0C; style = "curl"; }; };
      "diagnostic.hint" = { underline = { color = base0C; style = "curl"; }; };

      error = base08;
      warning = base0A;
      info = base0C;
      hint = base0C;
    };
  };
 };
}
