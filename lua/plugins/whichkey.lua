return {
  { "echasnovski/mini.icons", version = false },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      { "<leader>hc", "<cmd>HopChar2<CR>", desc = "光标跳转" },
      { "<leader>hw", "<cmd>HopWord<CR>", desc = "光标跳转" },

      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 2" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 3" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 4" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 5" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 6" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 7" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 8" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 9" },
      { "<leader>bd", "<cmd>bdelete %<CR>", desc = "关闭当前Buffer" },
      { "<leader>bf", "<cmd>Neotree buffers reveal float<CR>", desc = "浮动Buffer树" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "下一个Buffer" },
      { "<leader>bo", "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>", desc = "关闭其他Buffer" },
      { "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", desc = "上一个Buffer" },

      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "文件树" },

      { "<leader>g", group = "lsp" },
      { "<leader>gf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "格式化" },
      { "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover", mode = "n" },
      { "<leader>gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "code_action" },
      { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "跳转到定义" },
      { "<leader>gu", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "显示引用列表" },

      { "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },

      { "<leader>f", group = "查找" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "打开最近文件", remap = false },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "搜索文件内容" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffer搜索" },
    },
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      local wk = require("which-key")
      wk.add({
        {
          -- Nested mappings are allowed and can be added in any order
          -- Most attributes can be inherited or overridden on any level
          -- There's no limit to the depth of nesting
          mode = { "n", "v" }, -- NORMAL and VISUAL mode
          { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
          { "<leader>w", "<cmd>w<cr>", desc = "Write" },
        },
      })
    end,
  },
}
