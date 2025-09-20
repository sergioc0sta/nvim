local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

require('dap-go').setup()

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
