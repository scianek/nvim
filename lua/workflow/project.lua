return {
    "scianek/project.nvim",
    event = "VeryLazy",
    config = function()
        require("project_nvim").setup({
            patterns = {
                ".git",
                "Cargo.toml",
                "go.mod",
                "docker-compose.yml",
                "package.json",
                "CMakeLists.txt",
                "gradlew",
                "pyproject.toml",
                "mix.exs",
            },
        })
    end,
}
