local M = {}

function M.init()
    -- LSPs are heavy so we're lazy loading then now
    -- Actual functionality provided by lsp_zero lives in lsp_init.lua
    -- We're bundling lsp-saga too. Combo works well for my workflow.
    local status_ok, lsp_init = pcall(require, "lsp_init")
    if status_ok then
        lsp_init.setup()
    end
end

return M
