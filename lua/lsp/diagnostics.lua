vim.diagnostic.config({
    severity_sort = true,
    virtual_lines = true,
    virtual_text = false,
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = "󰋼 ",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticError",
            [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
    },
    float = {
        border = "rounded", -- Rounded border
        source = "if_many", -- Show the source of the diagnostic
        header = "", -- No header in the floating window
        prefix = "", -- No prefix for each diagnostic
    },
})

return {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
        {
            "<A-t>",
            cmd("Trouble diagnostics toggle"),
            desc = "Toggle Trouble",
        },
        {
            "<leader>tt",
            cmd("Telescope diagnostics"),
            desc = "Telescope Diagnostics",
        },
    },
    opts = {
        position = "right",
    },
}
