    return {


        {
            'numToStr/Comment.nvim',
            opts = {},
            lazy = false,
            config = function()
                require('Comment').setup({
                    padding = true,
                    sticky = true,
                    ignore = nil,
                    toggler = {
                        line = 'gcc',
                        block = 'gbc',
                    },
                    opleader = {
                        line = 'gc',
                        block = 'gb',
                    },
                    extra = {
                        above = 'gcO',
                        below = 'gco',
                        eol = 'gcA',
                    },
                    mappings = {
                        basic = true,
                        extra = true,
                    },
                    pre_hook = nil,
                    post_hook = nil,
                })
            end,
        },




        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                -- nvim cmp integration
                -- If you want insert `(` after select function or method item
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                local cmp = require("cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

                require("nvim-autopairs").setup({
                    disable_filetype = { "TelescopePrompt", "vim" },
                })
            end,
        },




        {
        "nat-418/boole.nvim",
        config = function()
            require("boole").setup({
                mappings = {
                    increment = "<C-a>",
                    decrement = "<C-x>",
                },
                -- User defined loops
                additions = {
                    { "Foo", "Bar" },
                    { "tic", "tac", "toe" },
                    { "foo", "bar", "baz" },
                    { "left", "right", "top", "bottom" },
                },
                allow_caps_additions = {
                    --{ "enable", "disable" },
                    -- enable → disable
                    -- Enable → Disable
                    -- ENABLE → DISABLE
                },
            })
        end,
        },



    }
