return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>tc", cmd("TodoTelescope"), desc = "Todo Comments" },
    },
    opts = {},
}
