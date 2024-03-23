return { 
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.6", 
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-frecency.nvim" },
  config = function()
    require("telescope").load_extension "frecency"

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>p", builtin.find_files, {}) 
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>")
  end
}
