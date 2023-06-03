return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use "chriskempson/base16-vim"

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use "neovim/nvim-lspconfig"
end)
