return {
    "artemave/workspace-diagnostics.nvim",
    event = "LspAttach",
    init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            pattern = "*",
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client or client.name == "copilot" then
                    return
                end
                require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
            end,
        })
    end,
}
