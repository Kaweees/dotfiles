-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

-- vim.opt.guicursor = ""

-- Make line numbers default
vim.opt.number = true

-- Add relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Automatically save before running commands that expect a saved file
vim.opt.autowriteall = true

-- Enable line wrapping
vim.opt.wrap = true

-- Automatically indent new lines
vim.opt.autoindent = true

-- Enable syntax highlighting
vim.opt.syntax = 'enable'

-- Automatically go to the next line when a line is wrapped
vim.opt.linebreak = true

-- Automatically go to t

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- vim.opt.smartindent = true

-- vim.opt.wrap = false

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

-- vim.opt.incsearch = true

-- vim.opt.termguicolors = true

-- vim.opt.isfname:append("@-@")


--vim.opt.colorcolumn = "80"
