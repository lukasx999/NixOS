    return {


        {
            "nvim-treesitter/nvim-treesitter",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            --event = "VeryLazy",
            cmd = "TSUpdate",
            config = function()
                --vim.cmd(":silent TSUpdate")
                require("nvim-treesitter.configs").setup({
                    ensure_installed = {
                        "c",
                        "cpp",
                        "vim",
                        "vimdoc",
                        -- "yuck",
                        "lua",
                        "ini",
                        -- "java",
                        "json",
                        "arduino",
                        "nix",
                        "r",
                        "sql",
                        "vim",
                        -- "matlab",
                        "vimdoc",
                        "query",
                        "bash",
                        "css",
                        "go",
                        "asm",
                        "html",
                        "rasi",
                        "markdown",
                        "markdown_inline",
                        --"latex",
                        "hyprlang",
                        "rust",
                        "regex",
                    },

                    auto_install = true,

                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = true,
                    },

                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            --[[
                        init_selection = "<leader>ss",
                        node_incremental = "<leader>si",
                        scope_incremental = "<leader>sc",
                        node_decremental = "<leader>sd",
                        ]]
                            init_selection = '<CR>',
                            scope_incremental = '<CR>',
                            node_incremental = '<TAB>',
                            node_decremental = '<S-TAB>',
                        },
                    },


                    indent = {
                        enable = true,
                    },

                    textobjects = {

                        move = {
                            enable = true,

                            goto_next_start = {
                                ["<leader>mf"] = { query = "@function.outer", desc = "next function" },
                                ["<leader>mc"] = { query = "@class.outer", desc = "next class" },
                                ["<leader>md"] = { query = "@conditional.outer", desc = "next conditional" },
                                ["<leader>ml"] = { query = "@loop.outer", desc = "next loop" },

                                ["<leader>mt"] = { query = "@comment.outer", desc = "next comment" },
                            },
                            goto_previous_start = {
                                ["<leader>mF"] = { query = "@function.outer", desc = "previous function" },
                                ["<leader>mC"] = { query = "@class.outer", desc = "previous class" },
                                ["<leader>mD"] = { query = "@conditional.outer", desc = "previous conditional" },
                                ["<leader>mL"] = { query = "@loop.outer", desc = "previous loop" },

                                ["<leader>mT"] = { query = "@comment.outer", desc = "previous comment" },
                            },
                        },

                        select = {
                            enable = true,

                            -- Automatically jump forward to textobj, similar to targets.vim
                            lookahead = true,

                            keymaps = {

                                --["af"] = "@function.outer",
                                --["if"] = "@function.inner",
                                --["ac"] = "@class.outer",
                                ["af"] = { query = "@function.outer", desc = "outer function" },
                                ["if"] = { query = "@function.inner", desc = "inner function" },
                                ["ac"] = { query = "@class.outer", desc = "outer class" },
                                ["ic"] = { query = "@class.inner", desc = "inner class" },
                                ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
                                ["id"] = { query = "@conditional.inner", desc = "inner conditional" },
                                ["al"] = { query = "@loop.outer", desc = "outer loop" },
                                ["il"] = { query = "@loop.inner", desc = "inner loop" },

                                ["at"] = { query = "@comment.outer", desc = "outer comment" },
                                ["it"] = { query = "@comment.inner", desc = "inner comment" },


                                -- You can also use captures from other query groups like `locals.scm`
                                --["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },

                            },
                            selection_modes = {

                                --["@parameter.outer"] = "v", -- charwise

                                ["@function.outer"] = "V",  -- linewise
                                ["@function.inner"] = "V",  -- linewise
                                ["@class.outer"] = "V",  -- linewise
                                ["@class.inner"] = "V",  -- linewise
                                ["@conditional.outer"] = "V",  -- linewise
                                ["@conditional.inner"] = "V",  -- linewise
                                ["@loop.outer"] = "V",  -- linewise
                                ["@loop.inner"] = "V",  -- linewise

                                ["@comment.outer"] = "V",  -- linewise
                                ["@comment.inner"] = "V",  -- linewise

                                --["@class.outer"] = "<c-v>", -- blockwise

                            },
                            -- If you set this to `true` (default is `false`) then any textobject is
                            -- extended to include preceding or succeeding whitespace. Succeeding
                            -- whitespace has priority in order to act similarly to eg the built-in
                            -- `ap`.

                            --include_surrounding_whitespace = true,
                        },
                    },
                })
            end,
        },





        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function()
                vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "none" })
                --vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "none" })
                --vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg="#45475b", bg = "none" })

                --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
                --vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

                vim.keymap.set("n", "<leader>tC", "<cmd>TSContextToggle<CR>", { desc = "Context" })

                vim.keymap.set("n", "<leader>lc", function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end, { desc = "go to Context", silent = true })

                require("treesitter-context").setup({
                    enable = true,
                    --max_lines = 0,
                    max_lines = 1,
                    multiline_threshold = 20,
                    line_numbers = true,
                    trim_scope = "outer",
                    mode = "cursor",
                })
            end,
        },






    }
