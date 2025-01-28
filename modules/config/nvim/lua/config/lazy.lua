-- This file can be loaded by calling `lua require('lazy')` from your init.vim

-- Setup lazy.nvim
return require("lazy").setup({
  -- Specify plugins
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    { "f4z3r/gruvbox-material.nvim",
      name = 'gruvbox-material',
      lazy = false, -- Load the colorscheme immediately
      priority = 1000, -- Set a high priority
      config = true,
      opts = ...
    },
    -- Utility functions for neovim plugins
    { "nvim-lua/plenary.nvim", -- don't forget to add this one if you don't have it yet!
      lazy = false,
      priority = 900,
    },
     -- Telescope (Fuzzy Finder)
     {
      'nvim-telescope/telescope.nvim', tag = '0.1.8', -- or branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Fast Syntax Highlighting tree
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
    },
     -- Harpoon
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- undotree
    {"mbbill/undotree"},
    -- LSP
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- Autocompletion
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    -- Material Icons
    {'DaikyXendo/nvim-material-icon'},
    -- WakaTime (Time Tracking)
    {'wakatime/vim-wakatime', lazy = false},
    -- Discord Rich Presence
    {'andweeb/presence.nvim'},
    -- GitHub Copilot (AI Autocompletion)
    { "zbirenbaum/copilot.lua" },
    -- C/C++ Code Formatting
    { "rhysd/vim-clang-format" },
    -- Colorizer
    { "norcalli/nvim-colorizer.lua" },
    -- Markdown Preview
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Lualine
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
