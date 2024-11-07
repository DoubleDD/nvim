return {
  -- vim-illuminate 高亮显示光标所在单词
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
    end,
  },
  -- nvim-cursorline 光标所在单词加下划线
  {
    "yamatsum/nvim-cursorline",
    event = "BufReadPost",
    config = function()
      require("nvim-cursorline").setup({
        cursorline = {
          enable = true,
          timeout = 1000,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 3,
          hl = { underline = true },
        },
      })
    end,
  },

  -- vim-highlightedyank 高亮复制的内容，持续1秒
  {
    "machakann/vim-highlightedyank",
    event = "TextYankPost",
    config = function()
      vim.g.highlightedyank_highlight_duration = 1000
    end,
  },
}
