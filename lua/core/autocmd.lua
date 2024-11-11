-- CUSTOM THINGS
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Close the initial empty buffer when starting Neovim if no files are open
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if #vim.api.nvim_list_bufs() == 1 and vim.bo[0].buftype == "" then
      vim.cmd("bd")
    end
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

