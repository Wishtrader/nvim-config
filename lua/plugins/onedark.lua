return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        code_style = {
          comments = "italic",
          keywords = "NONE",
          functions = "NONE",
          strings = "NONE",
          variables = "NONE",
        },
      })
    end,
  },
}
