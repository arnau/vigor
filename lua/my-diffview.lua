require("diffview").setup({
  diff_binaries = false, -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = false,
  signs = {
    fold_closed = "⋯",
    fold_open = "⚈",
  },
  file_panel = {
    listing_style = "tree", -- One of 'list' or 'tree'
    tree_options = { -- Only applies when listing_style is 'tree'
      flatten_dirs = true, -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
    },
    win_config = { -- See ':h diffview-config-win_config'
      position = "left",
      width = 35,
    },
  },
})
