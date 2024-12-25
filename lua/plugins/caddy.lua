return {
  "isobit/vim-caddyfile",
  config = function()
    local client = vim.lsp.start_client({
      name = "caddyfilelsp",
      cmd = { "/Users/kedong/code/com.github/DoubleDD/learning/lsp/caddyfile-language-server" },
      on_attach = function(_, _) end,
    })

    if not client then
      vim.notify("hey ,you didnt do the client thing good")
      return
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "caddyfile",
      callback = function()
        vim.lsp.buf_attach_client(0, client)
      end,
    })
  end,
}
