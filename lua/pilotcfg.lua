return {
  panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
  },
  suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 50,
      keymap = {
        accept = "<C-a>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-x>",
      },
  },
}
