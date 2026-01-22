local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

require('dap-go').setup()

local function get_cpptools_debugger()
  local ok_registry, mason_registry = pcall(require, "mason-registry")
  if ok_registry and mason_registry.has_package and mason_registry.has_package("cpptools") then
    local cpptools = mason_registry.get_package("cpptools")
    if cpptools and cpptools.is_installed and cpptools:is_installed()
        and cpptools.get_install_path then
      return cpptools:get_install_path()
        .. "/extension/debugAdapters/bin/OpenDebugAD7"
    end
  end
  local exe = vim.fn.exepath("OpenDebugAD7")
  if exe ~= "" then
    return exe
  end
  return nil
end

dap.adapters.cppdbg = function(callback, _)
  local debugger_path = get_cpptools_debugger()
  if not debugger_path then
    vim.notify("OpenDebugAD7 not found. Install cpptools via Mason.", vim.log.levels.ERROR)
    return
  end
  callback({
    id = "cppdbg",
    type = "executable",
    command = debugger_path,
    options = { detached = false },
  })
end

local mi_mode = (vim.fn.has("mac") == 1) and "lldb" or "gdb"
dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    MIMode = mi_mode,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "Enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
}
dap.configurations.cpp = dap.configurations.c

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  }
}

local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

for _, language in ipairs(js_filetypes) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      name = "Launch with tsx",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      runtimeExecutable = "tsx",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      skipFiles = { 
        "<node_internals>/**", 
        "${workspaceFolder}/node_modules/**" 
      },
    }
  }
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
