-- Telescope configuration.
--
-- For generic mappings see `mappings.lua`.

local telescope = require("telescope")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

telescope.setup {
  defaults = {
    prompt_prefix = "· ",
    selection_caret = "· ",
    initial_mode = "insert",
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["xx"] = actions.delete_buffer,
        ["qq"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
      }

    },
    extensions = {
      ["ui-select"] = {
        themes.get_dropdown()
      }
    }
  }
}

-- [ plugins ]
telescope.load_extension("heading")
telescope.load_extension("ui-select")
telescope.load_extension("neoclip")
