return {
    flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
      latte = {
        -- custom everforest light hard port
        rosewater = "#a43b35",
        flamingo  = "#da3537",
        pink      = "#d332a1",
        mauve     = "#aa3685",
        red       = "#ff3532",
        maroon    = "#de3631",
        peach     = "#f36c0b",
        yellow    = "#bd8800",
        green     = "#596600",
        teal      = "#287e5e",
        sky       = "#52b1c7",
        sapphire  = "#3fb4b8",
        blue      = "#317da7",
        lavender  = "#474155",
        text      = "#4d4742",
        subtext1  = "#5b5549",
        subtext0  = "#6d6655",
        overlay2  = "#786d5a",
        overlay1  = "#8c7c62",
        overlay0  = "#a18d66",
        surface2  = "#c9bea5",
        surface1  = "#d8d3ba",
        surface0  = "#e8e2c8",
        base      = "#ebe4c8",
        mantle    = "#e1dab5",
        crust     = "#bdc0a0",
      },
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
}
