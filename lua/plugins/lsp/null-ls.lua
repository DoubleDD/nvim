return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local line_length = 80
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.formatting.xmllint.with({
            command = "xmllint",
            args = { "--format", "--encode", "UTF-8", "-" },
          }),
          ----------- python 格式化 start --------------
          -- 配置 black 用于代码格式化
          null_ls.builtins.formatting.black.with({
            command = os.getenv("HOME") .. "/miniconda3/bin/black",
            extra_args = { "--line-length", line_length }
          }),
          -- 配置 isort 用于 import 排序
          null_ls.builtins.formatting.isort.with({
            command = os.getenv("HOME") .. "/miniconda3/bin/isort",
            extra_args = { "--profile", "black", "--line-length", line_length }
          }),
          ----------- python 格式化 end ----------------
        },
      }
    end
  },
}
