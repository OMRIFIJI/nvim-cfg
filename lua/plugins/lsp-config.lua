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

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            })

            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })

            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.dockerls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })

            lspconfig.rust_analyzer.setup({ capabilities = capabilities })

            lspconfig.neocmake.setup({
                capabilities = capabilities,
            })

            -- SQL **TODO:setup properly**
            lspconfig.sqls.setup({ capabilities = capabilities })

            lspconfig.nginx_language_server.setup({capabilities = capabilities})

            lspconfig.texlab.setup({ capabilities = capabilities })

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

			lspconfig.dartls.setup({
				capabilities = capabilities,
				cmd = {
					"dart",
					"language-server",
					"--protocol=lsp",
				},
				filetypes = { "dart" },
				init_options = {
					onlyAnalyzeProjectsWithOpenFiles = false,
					suggestFromUnimportedLibraries = true,
					closingLabels = true,
					outline = false,
					flutterOutline = false,
				},
				settings = {
					dart = {
						updateImportsOnRename = true,
						completeFunctionCalls = true,
						showTodos = true,
					},
				},
			})

            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<leader>fd", vim.diagnostic.open_float)
            vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>H", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>he", vim.lsp.buf.signature_help, opts)
				end,
			})
        end,
        },
}
