-- Build/test runners on top of toggleterm's terminal #1 (floating, reused).
local M = {}

local last

-- Per-filetype commands, run from nvim's current working directory.
local commands = {
  go = { build = 'go build ./...', test = 'go test ./...' },
  rust = { build = 'cargo build', test = 'cargo test' },
  c = { build = 'make', test = 'make test' },
  cpp = { build = 'make', test = 'make test' },
  python = { test = 'pytest' },
}

---@param cmd string
function M.run(cmd)
  last = cmd
  require('toggleterm').exec(cmd, 1)
end

---@param kind 'build'|'test'
function M.run_kind(kind)
  local cmd = (commands[vim.bo.filetype] or {})[kind]
  if cmd then return M.run(cmd) end
  vim.ui.input({ prompt = kind .. ' command: ' }, function(input)
    if input and input ~= '' then M.run(input) end
  end)
end

function M.rerun()
  if last then
    M.run(last)
  else
    vim.notify('No previous terminal command', vim.log.levels.WARN)
  end
end

function M.prompt()
  vim.ui.input({ prompt = 'Run: ', default = last }, function(input)
    if input and input ~= '' then M.run(input) end
  end)
end

return M
