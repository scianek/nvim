return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    init = function()
        vim.api.nvim_create_augroup("handle_mouse", { clear = true })
        vim.api.nvim_create_autocmd("TermOpen", {
            group = "handle_mouse",
            pattern = "*",
            callback = function()
                vim.keymap.set("n", "<LeftRelease>", "<LeftRelease>i", { buffer = true })
            end,
        })

        vim.api.nvim_create_augroup("disable_folding_toggleterm", { clear = true })
        vim.api.nvim_create_autocmd("TermOpen", {
            group = "disable_folding_toggleterm",
            pattern = "toggleterm",
            callback = function()
                local winid = vim.api.nvim_get_current_win()
                vim.api.nvim_set_option_value("foldmethod", "manual", { win = winid })
                vim.api.nvim_set_option_value("foldtext", "foldtext()", { win = winid })
            end,
        })
    end,
    opts = {
        open_mapping = "<c-t>",
        size = 15,
        direction = "horizontal",
        shade_terminals = false,
    },
}
