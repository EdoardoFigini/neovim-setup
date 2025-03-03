local M = {}

local function command(cmd, dir)
  return "cd " .. dir .. " && " .. cmd .. ' && cd  "' .. vim.fn.getcwd() .. '"'
end

function M.build()
  local neoconf = require("neoconf")
  local cmd = neoconf.get("build.cmd")
  local dir = neoconf.get("build.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No build command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  vim.cmd("Exec " .. command(cmd, dir))
end

function M.run()
  local neoconf = require("neoconf")
  local cmd = neoconf.get("build.run.cmd")
  local dir = neoconf.get("build.run.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No run command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  vim.cmd("Exec " .. command(cmd, dir))
end

function M.build_and_run()
  local neoconf = require("neoconf")
  local build_cmd = neoconf.get("build.cmd")
  local run_cmd = neoconf.get("build.run.cmd")
  local bdir = neoconf.get("build.dir")
  local rdir = neoconf.get("build.run.dir")
  if not bdir then
    bdir = "."
  end
  if not rdir then
    rdir = "."
  end

  if not build_cmd then
    vim.notify("No build command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  if not run_cmd then
    vim.notify("No run command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  local build = command(build_cmd, bdir)
  local run = command(run_cmd, rdir)

  vim.cmd("Exec " .. build .. " && " .. run)
end

function M.clean()
  local neoconf = require("neoconf")
  local cmd = neoconf.get("build.clean.cmd")
  local dir = neoconf.get("build.clean.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No clean command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  vim.cmd("Exec " .. command(cmd, dir))
end

function M.config()
  local neoconf = require("neoconf")
  local cmd = neoconf.get("build.config.cmd")
  local dir = neoconf.get("build.config.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No config command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  vim.cmd("Exec " .. command(cmd, dir))
end

return M
