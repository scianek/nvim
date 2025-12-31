---@type vim.lsp.Config
return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
    settings = {
        python = {
            pythonPath = "python3",
        },
    },
    on_attach = function(client)
        local root_dir = client.config.root_dir
        if root_dir then
            local python_path
            if vim.fn.filereadable(root_dir .. "/pyproject.toml") == 1 then
                python_path = root_dir .. "/.venv/bin/python"
            else
                python_path = vim.fn.exepath("python3") or vim.fn.exepath("python")
            end
            client.config.settings.python["pythonPath"] = python_path
            client:notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
    end,
}
