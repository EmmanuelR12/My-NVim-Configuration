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
  --Buffers
  use({
    'akinsho/bufferline.nvim', 
    tag = "v3.*", 
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require("configs.bufferline")
    end
  }) 
  --Comments
  use("preservim/nerdcommenter")
  --identLines
  use ({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("configs.ident-blankline")
    end
  }) 
  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("configs.treesitter")
    end,
  })

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
  --Dashboard start
  use ({
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('configs.dashboard').setup{
      }
    end
  })
  --LSP autocompletado
  use ({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    },

    config = function()
      require("configs.lsp-zero")
    end,

  })
  --Change characters
  use('tpope/vim-surround')

-- Auto pairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("configs.autopairs")
        end,
    })
  --Git integration
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.gitsigns")
    end,
  })
  use("tpope/vim-fugitive")

end)
