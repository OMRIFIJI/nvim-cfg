return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "folke/neodev.nvim" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            })

            -- css, html, js
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })

            -- java
            lspconfig.jdtls.setup({ capabilities = capabilities })
            -- docker
            lspconfig.dockerls.setup({ capabilities = capabilities })
            -- Go, C++, json
            lspconfig.golangci_lint_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            -- Rust!!!
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            -- Cmake
            lspconfig.neocmake.setup({
                capabilities = capabilities,
            })

            -- SQL **TODO:setup properly**
            lspconfig.sqls.setup({ capabilities = capabilities })
            -- TEX
            lspconfig.texlab.setup({ capabilities = capabilities })
            -- python
            lspconfig.pylsp.setup {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                maxLineLength = 100
                            }
                        }
                    }
                }
            }

            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
        end,
        },
}
