local map = function(lhs, rhs, desc)
    if desc then
        desc = "[DAP] " .. desc
    end

    vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

require("dapui").setup()


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("nvim-dap-virtual-text").setup {
    enabled = true,

    -- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
    enabled_commands = false,

    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_changed_variables = true,
    highlight_new_as_changed = true,

    -- prefix virtual text with comment string
    commented = false,

    show_stop_reason = true,

}

map("<leader>d1", require("dap").step_back, "step_back")
map("<leader>d2", require("dap").step_into, "step_into")
map("<leader>d3", require("dap").step_over, "step_over")
map("<leader>d4", require("dap").step_out, "step_out")
map("<leader>d5", require("dap").continue, "continue")

-- TODO:
-- disconnect vs. terminate

map("<leader>dr", require("dap").repl.open)

map("<leader>db", require("dap").toggle_breakpoint)
map("<leader>dB", function()
    require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
end)

map("<leader>de", require("dapui").eval)
map("<leader>dE", function()
    require("dapui").eval(vim.fn.input "[DAP] Expression > ")
end)

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        -- detached = false,
    }
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp

dap.adapters.python = {
    type = 'executable';
    command = vim.fn.stdpath('data') .. '/mason/bin/debugpy-adapter';
}
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/env/bin/python') == 1 then
                return cwd .. '/env/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    },
}

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}', '--check-go-version=false'},
    -- add this if on windows, otherwise server won't open successfully
    -- detached = false
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug service",
    request = "launch",
    program = vim.fn.getcwd() .. '/main.go',
    args = {"-dw", "start"},
    env = {
            CONFIG_SOURCE = "local:default,global-config|sre|dataplatform",

        },
    outputMode = "remote",

  },
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = vim.fn.getcwd() .. '/main.go',
    args = function()
      local args = vim.fn.input('Args: ', '', 'file')
      if args == '' then
        return nil
      end
      return vim.split(args, ' ')
    end,
    env = {
            CONFIG_SOURCE = "local:default,global-config|sre",
        },
    outputMode = "remote",

  },
  {
    type = "delve",
    name = "Debug ATS",
    request = "launch",
    program = vim.fn.getcwd() .. '/.',
    args = function()
      local args = vim.fn.input('Args: ', '', 'file')
      if args == '' then
        return nil
      end
      return vim.split(args, ' ')
    end,
    env = {
            CONFIG_SOURCE = "local:default,global-config|sre",
            CGO_ENABLED = "0"
        },
    outputMode = "remote",

  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
    outputMode = "remote",
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
    outputMode = "remote",
  },
}
