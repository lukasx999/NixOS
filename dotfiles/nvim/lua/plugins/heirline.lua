return {}
--[[
return {
    "rebelot/heirline.nvim",
    event = "UiEnter",
    config = function()
        require("heirline").setup({

            statusline = {},
            winbar = {},
            tabline = {},
            statuscolumn = {},

        })
    end
}
]]
