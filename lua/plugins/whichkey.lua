return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

      local wk = require("which-key")

      -- leader
      wk.register({
        e = { "<cmd>Neotree toggle<CR>", "文件树" },
        f = { "<cmd>lua vim.lsp.buf.format()<CR>", "格式化" },
        s = {
          name = "搜索",
          f = { "<cmd>Telescope find_files<cr>", "查找文件" }, -- 创建带标签的绑定
          r = { "<cmd>Telescope oldfiles<cr>", "打开最近文件", noremap = true }, -- 创建键位时附加选项
          t = { "<cmd>Telescope live_grep<cr>", "搜索文件内容" },
        },

        g = {
          name = "goto",
          d = { vim.lsp.buf.definition, "跳转到定义" },
          r = { vim.lsp.buf.definition, "显示引用列表" },
          c = { vim.lsp.buf.definition, "code_action" },
        },

        m = { "<cmd>Mason<CR>", "Mason", silent = true },

        -- 快速在buffer间跳转
        ["1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 1", silent = true },
        ["2"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 2", silent = true },
        ["3"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 3", silent = true },
        ["4"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 4", silent = true },
        ["5"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 5", silent = true },
        ["6"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 6", silent = true },
        ["7"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 7", silent = true },
        ["8"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 8", silent = true },
        ["9"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "Buffer 9", silent = true },
        b = {
          f = { "<cmd>Neotree buffers reveal float<CR>", "浮动文件树", silent = true },
          n = { "<cmd>BufferLineCycleNext<CR>", "下一个Buffer", silent = true },
          p = { "<cmd>BufferLineCyclePrev<CR>", "上一个Buffer", silent = true },
          d = { "<cmd>bdelete %<CR>", "关闭当前Buffer", silent = true },
          o = {
            "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>",
            "关闭其他Buffer",
            silent = true,
          },
        },

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
