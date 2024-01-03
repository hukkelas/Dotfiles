-- LSP Configuration & Plugins
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
            },
            "folke/neodev.nvim",
            "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    "pylsp",
                    "vimls",
                },
                automatic_installation = true,
            })

            -- Quick access via keymap
            require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

            -- Neodev setup before LSP config
            require("neodev").setup()


            require("fidget").setup()

            -- Set up cool signs for diagnostics
            local signs = { Error = "", Warn = "", Hint = "", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Diagnostic config
            local config = {
                virtual_text = false,
                signs = {
                    active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }
            vim.diagnostic.config(config)

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                local lsp_map = require("helpers.keys").lsp_map

                lsp_map("<leader>sa", vim.lsp.buf.code_action, bufnr, "Code action")
                lsp_map("<leader>sd", vim.lsp.buf.type_definition, bufnr, "Type definition")
                lsp_map("<leader>se", vim.diagnostic.open_float, bufnr, "Show error")
                lsp_map("<leader>sl", require("telescope.builtin").lsp_document_symbols, bufnr,
                    "Document symbols")

                lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition1")
                lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                lsp_map("gi", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
                lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
                lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
                lsp_map("[d", function() vim.diagnostic.goto_next() end, bufnr, "Next error")
                lsp_map("]d", function() vim.diagnostic.goto_prev() end, bufnr, "Previous error")
                lsp_map("<leader>sh", function() vim.lsp.buf.signature_help() end, bufnr, "Help")

                -- Create a command `:Format` local to the LSP buffer
                vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                    vim.lsp.buf.format()
                end, { desc = "Format current buffer with LSP" })

                lsp_map("<leader>=", "<cmd>Format<cr>", bufnr, "Format")

                -- Attach and configure vim-illuminate
                require("illuminate").on_attach(client)
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Lua
            require("lspconfig")["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })
            require("lspconfig")["pylsp"].setup({
                on_attach = on_attach,
                capabilities = capabilities
            })
            require("lspconfig")["clangd"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                server = {
                    cmd = { "clangd",
                        "--query-driver='/usr/bin/gcc'",
                    },
                }
            })
        end,
    },
}
