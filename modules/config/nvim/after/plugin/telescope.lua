local builtin = require('telescope.builtin')
-- File search, looks through all files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- File search, skips files ignored by git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
