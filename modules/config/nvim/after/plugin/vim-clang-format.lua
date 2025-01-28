-- Format on save
vim.cmd [[
  augroup ClangFormatAutogroup
    autocmd!
    autocmd BufWritePre *.c,*.cpp,*.h,*.hpp ClangFormat
  augroup END
]]

