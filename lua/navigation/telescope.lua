return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        event = "VeryLazy",
        keys = {
            { "<c-p>", cmd("Telescope find_files"), desc = "Find Files" },
            { "<leader>g", cmd("Telescope live_grep"), desc = "Live Grep" },
            { "<leader>th", cmd("Telescope highlights"), desc = "Highlights" },
            { "<leader>tb", cmd("Telescope git_branches"), desc = "Git Branches" },
        },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
                defaults = {
                    path_display = { "filename_first" },
                    prompt_prefix = "    ",
                    selection_caret = "  ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.9,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    mappings = {
                        i = {
                            ["<c-f>"] = actions.close,
                            ["<c-j>"] = actions.move_selection_next,
                            ["<c-k>"] = actions.move_selection_previous,
                            ["<C-p>"] = actions.move_selection_next,
                        },
                    },
                },
            })
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },
}
