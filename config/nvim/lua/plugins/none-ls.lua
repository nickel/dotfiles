return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type='Spaces' --indent-width=2" },
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*" },
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}
