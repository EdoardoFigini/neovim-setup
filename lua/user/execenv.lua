local M = {}

function M.msvc()
  vim.opt.shell = "cmd.exe"
  vim.opt.shellredir = "> %s"
  vim.opt.shellpipe = "> %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag =
    '/c "C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\Common7\\Tools\\VsDevCmd.bat" -arch=x64 -host_arch=x64 && '
  vim.notify("Execution environment set to MSVC")
end

function M.pwsh()
  vim.opt.shell = "pwsh.exe"
  vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering = 'Ansi'; "
  vim.notify("Execution environment set to Powershell 7")
end

function M.cmd()
  vim.opt.shell = "cmd.exe"
  vim.opt.shellredir = "> %s"
  vim.opt.shellpipe = "> %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "/c "
  vim.notify("Execution environment set to cmd.exe")
end

function M.wsl()
  vim.opt.shell = "wsl"
  vim.opt.shellredir = "> %s"
  vim.opt.shellpipe = "> %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "-e bash -c "
  vim.notify("Execution environment set to WSL")
end

return M
