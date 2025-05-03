local conform = require("conform")
local mason_registry = require("mason-registry")

local function is_installed(name)
  return mason_registry.has_package(name) and mason_registry.get_package(name):is_installed()
end

local formatters_by_ft = {}

if is_installed("stylua") then
  formatters_by_ft.lua = { "stylua" }
end

if is_installed("gofumpt") then
  formatters_by_ft.go = { "gofumpt" }
elseif is_installed("goimports") then
  formatters_by_ft.go = { "goimports" }
elseif is_installed("golines") then
  formatters_by_ft.go = { "golines" }
end

if is_installed("clang-format") then
  formatters_by_ft.c = { "clang_format" }
  formatters_by_ft.cpp = { "clang_format" }
end

if is_installed("jsonlint") then
  formatters_by_ft.json = { "jsonlint" }
end

if is_installed("yamlfmt") then
  formatters_by_ft.yaml = { "yamlfmt" }
elseif is_installed("yamlfix") then
  formatters_by_ft.yaml = { "yamlfix" }
end

if is_installed("sql-formatter") then
  formatters_by_ft.sql = { "sql_formatter" }
elseif is_installed("sqlfmt") then
  formatters_by_ft.sql = { "sqlfmt" }
end

if is_installed("elm-format") then
  formatters_by_ft.elm = { "elm_format" }
end

conform.setup({
  formatters_by_ft = formatters_by_ft,
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})

