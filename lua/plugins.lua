-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")
  --Theme
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Icons
  use("nvim-tree/nvim-web-devicons")
  --StatusLine
  use({
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("configs.lualine")
    end,
    requires = { "nvim-web-devicons" },
  })
  --necessary for other plugins
  use("nvim-lua/plenary.nvim")
  -- Telescope finder files
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  -- File manager
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("configs.neotree")
    end
  })
  --Navigate between panels
  use('christoomey/vim-tmux-navigator')
  --Completetion


end)
