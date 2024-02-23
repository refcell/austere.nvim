return {
    layout = {
        { type = "padding", val = 6 },
        require 'dash.header',
        { type = "padding", val = 2 },
        require 'dash.mrus',
        { type = "padding", val = 1 },
        {
          type = "text",
          val = "Quick Actions",
          opts = { hl = "SpecialComment", position = "center" },
        },
        { type = "padding", val = 1 },
        require 'dash.buttons',
        { type = "padding", val = 1 },
        {
          type = "text",
          val = "󰓂 My Github PRs",
          opts = { hl = "SpecialComment", position = "center" },
        },
        { type = "padding", val = 1 },
        require 'dash.ghprs',
    },
}
