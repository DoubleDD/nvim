return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
  -- rainbow-delimiters.nvim 插件
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- 插件配置
      local rainbow_delimiters = require("rainbow-delimiters")

      -- 设置高亮策略
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"], -- 全局策略
        },
        query = {
          [""] = "rainbow-delimiters", -- 使用默认查询
          lua = "rainbow-blocks", -- 对于 Lua 语言，使用块高亮
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
        -- blacklist = { "html", "jsx", "tsx" }, -- 如果需要，可以添加不启用的文件类型
      }
    end,
  },
}
