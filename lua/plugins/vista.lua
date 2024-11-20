return {
  {
    "liuchengxu/vista.vim",
    config = function()
      -- 设置 vista 使用 LSP 作为大纲的来源
      vim.g.vista_default_executive = "nvim_lsp"
      -- 可选：设置键绑定快速打开 vista 侧边栏
      vim.keymap.set("n", "<leader>o", ":Vista!!<CR>", { silent = true, noremap = true })
    end,
  },
}
