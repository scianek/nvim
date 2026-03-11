return {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    ft = "json",
    event = { "BufRead", "BufNewFile" },
    keys = {
        { "<leader>ps", cmd("PackageInfoShow"), desc = "Show package info" },
        { "<leader>pc", cmd("PackageInfoHide"), desc = "Hide package info" },
        { "<leader>pu", cmd("PackageInfoUpdate"), desc = "Update package" },
        { "<leader>pd", cmd("PackageInfoDelete"), desc = "Delete package" },
        { "<leader>pi", cmd("PackageInfoInstall"), desc = "Install package" },
        { "<leader>pv", cmd("PackageInfoChangeVersion"), desc = "Change package version" },
    },
    opts = {
        package_manager = "pnpm",
    },
}
