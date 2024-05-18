    return {


        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },


        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = { "mason.nvim" },
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "lua_ls",
                        -- "tsserver",
                        "bashls",
                        "clangd",
                        "jsonls",
                        "ltex",
                        "marksman",
                        --"pylsp",
                        "jedi_language_server",
                        "cssls",
                        -- "asm_lsp",
                        "arduino_language_server",
                        "cmake",
                        "html",
                        "rnix",
                        "yamlls",
                        -- "rubocop",
                        "rust_analyzer",
                        "sqlls",
                        -- "matlab_ls",
                        -- "autotools_ls",
                        -- "jinja_lsp",
                        -- "hdl_checker",
                        "gopls",
                        "awk_ls",
                    },
                })
                require("mason-lspconfig").setup_handlers({
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                })
            end,
        },





    }
