return {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "codecompanion" },
    lazy = false,
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "codecompanion",
            callback = function()
                vim.schedule(function()
                    vim.cmd([[Markview attach]])
                end)
            end,
        })
    end,
    opts = {
        preview = {
            filetypes = { "markdown", "codecompanion" },
            modes = { "n", "i", "no", "c" },
            hybrid_modes = { "i" },
        },
    },
}
