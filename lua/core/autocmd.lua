-- CUSTOM THINGS
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>x", true, false, true), "n", true)
    end,
})
-- Highlight on yank
--   See :help vim.highlight.on_yank()
augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
  group = "HighlightYank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

