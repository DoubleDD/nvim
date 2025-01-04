return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier, -- 使用 Prettier 进行格式化
          -- null_ls.builtins.diagnostics.eslint, -- 使用 ESLint 进行代码检查
        },
      }
    end
  },
}
