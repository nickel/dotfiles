return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      servers = {
        tailwindcss = {}
      }
    }
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      }
    }
  }
}
