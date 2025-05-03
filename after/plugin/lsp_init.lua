return {
    setup = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.preset('recommended')

        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local signs = {
            { name = "DiagnosticSignError", text = "E" },
            { name = "DiagnosticSignWarn",  text = "W" },
            { name = "DiagnosticSignHint",  text = "H" },
            { name = "DiagnosticSignInfo",  text = "I" },
        }

        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end

        vim.o.updatetime

        lsp_zero.setup()
    end
}
