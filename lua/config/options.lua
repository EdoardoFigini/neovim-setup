-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- default execution environment is Powershell 7
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering = 'Ansi'; "
vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

vim.g.autoformat = false
