return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local wk = require("which-key")
      wk.register({
        -- f = {
        --   name = "文件", -- 可选分组名
        --   f = { "<cmd>Telescope find_files<cr>", "查找文件" }, -- 创建带标签的绑定
        --   r = { "<cmd>Telescope oldfiles<cr>", "打开最近文件", noremap = true, buffer = 123 }, -- 创建键位时附加选项
        --   n = { "新建文件" }, -- 仅一个标签。不创建任何映射
        --   e = "编辑文件", -- 同上
        --   ["1"] = "which_key_ignore", -- 特殊标签以在弹出框中隐藏它
        --   b = {
        --     function()
        --       print("bar")
        --     end,
        --     "Foobar",
        --   }, -- 还可以传递函数！
        -- },
      }, { prefix = "<leader>" })
    end,
  },
}
