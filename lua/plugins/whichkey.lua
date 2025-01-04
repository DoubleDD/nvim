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

      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "Buffer 2" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "Buffer 3" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "Buffer 4" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "Buffer 5" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "Buffer 6" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "Buffer 7" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", desc = "Buffer 8" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", desc = "Buffer 9" },
      { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "文件树" },
      { "<leader>M", "<cmd>Mason<CR>", desc = "Mason" },
      { "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy" },



      -- 设置 DAP 键绑定
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "continue",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = 'step_over'
      },
      {
        "<F7>",
        function()
          require("dap").step_into()
        end,
        desc = 'step_into'
      },
      {
        "<F8>",
        function()
          require("dap").step_out()
        end,
      },
      {
        "<Leader>b",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = 'toggle_breakpoint'
      },
      {
        "<Leader>B",
        function()
          require("dap").set_breakpoint()
        end,
        desc = 'set_breakpoint'
      },
      {
        "<Leader>lp",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
        desc = 'set_breakpoint Log message'
      },
      {
        "<Leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = 'repl.open()'
      },
      {
        "<Leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = 'run_last'
      },
      -- 设置 DAP UI 键绑定
      {
        "<Leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = 'Debug视图'
      },
      {
        "<Leader>de",
        function()
          require("dapui").eval()
        end,
        desc = 'eval'
      },
    },
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      local wk = require("which-key")
      wk.add({
        {
          -- Nested mappings are allowed and can be added in any order
          -- Most attributes can be inherited or overridden on any level
          -- There's no limit to the depth of nesting
          mode = { "n", "v" },                          -- NORMAL and VISUAL mode
          { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
          { "<leader>w", "<cmd>w<cr>", desc = "Write" },
        },
        {
          -- 代码折叠
          { "<leader>z", group = "折叠" },
          { "<leader>zc", "zc", desc = "折叠光标坐在位置" },
          { "<leader>zo", "zo", desc = "展开光标坐在位置" },
          { "<leader>za", "za", desc = "折叠/展开光标坐在行" },
          { "<leader>zr", "zR", desc = "展开所有" },
          { "<leader>zm", "zM", desc = "折叠所有" },

          { "<leader>b", group = "Buffer" },
          { "<leader>bd", "<cmd>bdelete %<CR>", desc = "关闭当前Buffer" },
          { "<leader>bf", "<cmd>Neotree buffers reveal float<CR>", desc = "浮动Buffer树" },
          { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "下一个Buffer" },
          { "<leader>bo", "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>", desc = "关闭其他Buffer" },
          { "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", desc = "上一个Buffer" },


          { "<leader>g", group = "LSP" },
          { "<leader>gf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "格式化" },
          { "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover", mode = "n" },
          { "<leader>gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "code_action" },
          { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "跳转到定义" },
          { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "跳转到实现类" },
          { "<leader>gu", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "显示引用列表" },
          { "<leader>go", "<cmd>Vista!!<CR>", desc = "显示Outline" },
          -- 代码重构
          { "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "变量重命名" },


          { "<leader>f", group = "查找" },
          { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
          { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "打开最近文件", remap = false },
          { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "搜索文件内容" },
          { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffer搜索" },

        },
      })
    end,
  },
}
