local map = function(lhs, rhs, desc)
    if desc then
        desc = "[DAP] " .. desc
    end

    vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end

require("dapui").setup()
require('dap-go').setup()


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
