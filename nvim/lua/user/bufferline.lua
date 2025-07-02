local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then return end

bufferline.setup {
  options = {
    numbers = "none",                        -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d",           -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d",     -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",        -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,              -- can be a string | function, see "Mouse actions"
    indicator = { icon = "▎", style = "icon" },
    buffer_close_icon = '',
    modified_icon = "󰆓",
    close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30,     -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = false,        -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,     -- whether or not custom sorted buffers should persist
    separator_style = "thin",     -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true
  },
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" }
    },
    background = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" }
    },

    buffer_selected = {
      fg = '#ffcc00',
      -- bg = '#6b6b6a',
      bold = true,
      italic = true
    },
    close_button = {
      fg = { attribute = "fg", highlight = "tabline" },
      bg = { attribute = "bg", highlight = "tabline" }
    },
    close_button_visible = {
      fg = { attribute = "fg", highlight = "tabline" },
      bg = { attribute = "bg", highlight = "tabline" }
    },
    tab_selected = {
      fg = { attribute = "fg", highlight = "normal" },
      bg = { attribute = "bg", highlight = "normal" }
    },
    tab = {
      fg = { attribute = "fg", highlight = "tabline" },
      bg = { attribute = "bg", highlight = "tabline" }
    },
    tab_close = {
      -- fg = {attribute='fg',highlight='lspdiagnosticsdefaulterror'},
      fg = { attribute = "fg", highlight = "tablinesel" },
      bg = { attribute = "bg", highlight = "normal" }
    },
    modified = {
      fg = { attribute = "fg", highlight = "tabline" },
      bg = { attribute = "bg", highlight = "tabline" }
    },
    modified_selected = {
      fg = { attribute = "fg", highlight = "normal" },
      bg = { attribute = "bg", highlight = "normal" }
    },
    modified_visible = {
      fg = { attribute = "fg", highlight = "tabline" },
      bg = { attribute = "bg", highlight = "tabline" }
    },

    separator = {
      fg = { attribute = "bg", highlight = "tabline" },
      bg = { attribute = "bg", highlight = "tabline" }
    },
    separator_selected = {
      fg = { attribute = "bg", highlight = "normal" },
      bg = { attribute = "bg", highlight = "normal" }
    },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "lspdiagnosticsdefaulthint" },
      bg = { attribute = "bg", highlight = "normal" }
    }
  }
}
