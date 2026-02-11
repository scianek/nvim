return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "󰍴" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "│" },
            },
        },
    },

    {
        "f-person/git-blame.nvim",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>b", cmd("GitBlameToggle"), desc = "Toggle Git Blame" },
        },
        opts = {
            enabled = false,
            message_template = " <summary> • <date> • <author> • <<sha>>",
            date_format = "%m-%d-%Y %H:%M:%S",
            virtual_text_column = 1,
        },
    },

    { "akinsho/git-conflict.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
}
