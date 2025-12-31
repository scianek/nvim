return {
    "stevearc/conform.nvim",
    keys = {
        { "<leader>f", cmd("Format"), desc = "Format buffer" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "biome", "biome-organize-imports" },
                typescript = { "biome", "biome-organize-imports" },
                javascriptreact = { "biome", "biome-organize-imports" },
                typescriptreact = { "biome", "biome-organize-imports" },
                json = { "biome", "biome-organize-imports" },
                css = { "biome", "biome-organize-imports" },
                go = { "gofumpt" },
                python = { "black" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            require("conform").format({ async = true, lsp_format = "fallback", range = range })
        end, { range = true })
    end,
}
