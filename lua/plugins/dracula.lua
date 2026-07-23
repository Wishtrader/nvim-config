return {
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function()
      require("dracula").setup({
        colors = {
          bg = "#282a36",
          menu = "#282a36",
          visual = "#44475a",
          comment = "#6272a4",
          red = "#ff5555",
          orange = "#ffb86c",
          pink = "#ff79c6",
          purple = "#bd93f9",
          cyan = "#8be9fd",
          green = "#50fa7b",
          yellow = "#f1fa8c",
        },
        italic_comment = true,
        overrides = {},
      })
    end,
  },
}
