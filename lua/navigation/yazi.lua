return {
    "mikavilpas/yazi.nvim",
    lazy = false,
    keys = {
        { "<C-n>", cmd("Yazi"), desc = "Toggle Yazi" },
    },
    init = function()
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        open_for_directories = true,
        open_file_function = function(path, _)
            vim.cmd("edit " .. vim.fn.fnameescape(path)) -- Force open file
        end,
    },
}
