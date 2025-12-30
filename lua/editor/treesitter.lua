return {
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- stylua: ignore
            require("nvim-treesitter").install({
                "bash", "css", "dockerfile", "gitignore", "go", "gomod", "gosum",
                "gowork", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
                "python", "tsx", "typescript", "vim", "yaml",
            })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
                group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
                callback = function(ev)
                    pcall(vim.treesitter.start, ev.buf)
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- branch = "main",  -- doesnt work for now
        commit = "ecd03f5811eb5c66d2fa420b79121b866feecd82", -- remove later
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    enable = true,
                    lookahead = true,
                    include_surrounding_whitespace = false,
                },
            })
            local ts_select = require("nvim-treesitter-textobjects.select")
            vim.keymap.set({ "x", "o" }, "af", function()
                ts_select.select_textobject("@function.outer", "textobjects")
            end, { desc = "outer function" })
            vim.keymap.set({ "x", "o" }, "if", function()
                ts_select.select_textobject("@function.inner", "textobjects")
            end, { desc = "inner function" })
            vim.keymap.set({ "x", "o" }, "ac", function()
                ts_select.select_textobject("@class.outer", "textobjects")
            end, { desc = "outer class" })
            vim.keymap.set({ "x", "o" }, "ic", function()
                ts_select.select_textobject("@class.inner", "textobjects")
            end, { desc = "inner class" })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-context" },
}
