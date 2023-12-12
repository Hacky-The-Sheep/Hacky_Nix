{ config, ... }:

{
  programs.gitui = {
    enable = true;
    theme = 
      '' (
      selected_tab: Reset,
      selected_tab: Reset,
      command_fg: #${config.colorScheme.colors.base05},
      selection_bg: #${config.colorScheme.colors.base0D},
      selection_fg: #${config.colorScheme.colors.base05},
      cmdbar_bg: #${config.colorScheme.colors.base0D},
      disabled_fg: #${config.colorScheme.colors.base01},
      diff_line_add: #${config.colorScheme.colors.base0B},
      diff_line_delete: #${config.colorScheme.colors.base08},
      diff_file_added: #${config.colorScheme.colors.base0E},
      diff_file_removed: #${config.colorScheme.colors.base0F},
      diff_file_moved: #${config.colorScheme.colors.base0C},
      diff_file_modified: #${config.colorSheme.colors.base0A},
      commit_hash: #${config.colorScheme.colors.base09},
      commit_time: #${config.colorScheme.colors.base0C},
      commit_author: #${config.colorScheme.colors.base0B},
      danger_fg: #${config.colorScheme.colors.base08},
      push_gauge_bg: #${config.colorScheme.colors.base0D},
      push_gauge_fg: Reset,
      tag_fg: LightMagenta,
      branch_fg: LightYellow,
    )
  '';
  };
}
