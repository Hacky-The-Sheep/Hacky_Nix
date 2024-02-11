{ config, ... }:

{
  programs.gitui = {
    enable = true;
    theme = 
      '' (
      selected_tab: Reset,
      command_fg: Rgb(205, 214, 244),
      selection_bg: Rgb(88, 91, 112),
      selection_fg: Rgb(205, 214, 244),
      cmdbar_bg: Rgb(24, 24, 37),
      cmdbar_extra_lines_bg: Rgb(24, 24, 37),
      disabled_fg: Rgb(127, 132, 156),
      diff_line_add: Rgb(166, 227, 161),
      diff_line_delete: Rgb(243, 139, 168),
      diff_file_added: Rgb(249, 226, 175),
      diff_file_removed: Rgb(235, 160, 172),
      diff_file_moved: Rgb(203, 166, 247),
      diff_file_modified: Rgb(250, 179, 135),
      commit_hash: Rgb(180, 190, 254),
      commit_time: Rgb(186, 194, 222),
      commit_author: Rgb(116, 199, 236),
      danger_fg: Rgb(243, 139, 168),
      push_gauge_bg: Rgb(137, 180, 250),
      push_gauge_fg: Rgb(30, 30, 46),
      tag_fg: Rgb(245, 224, 220),
      branch_fg: Rgb(148, 226, 213)
    )
  '';
  };
}
      # command_fg: #${config.colorScheme.colors.base05},
      # selection_bg: #${config.colorScheme.colors.base0D},
      # selection_fg: #${config.colorScheme.colors.base05},
      # cmdbar_bg: #${config.colorScheme.colors.base0D},
      # disabled_fg: #${config.colorScheme.colors.base01},
      # diff_line_add: #${config.colorScheme.colors.base0B},
      # diff_line_delete: #${config.colorScheme.colors.base08},
      # diff_file_added: #${config.colorScheme.colors.base0E},
      # diff_file_removed: #${config.colorScheme.colors.base0F},
      # diff_file_moved: #${config.colorScheme.colors.base0C},
      # diff_file_modified: #${config.colorScheme.colors.base0A},
      # commit_hash: #${config.colorScheme.colors.base09},
      # commit_time: #${config.colorScheme.colors.base0C},
      # commit_author: #${config.colorScheme.colors.base0B},
      # danger_fg: #${config.colorScheme.colors.base08},
      # push_gauge_bg: #${config.colorScheme.colors.base0D},
      # push_gauge_fg: Reset,
      # tag_fg: ${config.colorScheme.colors.base0C},
      # branch_fg: ${config.colorScheme.colors.base09},
