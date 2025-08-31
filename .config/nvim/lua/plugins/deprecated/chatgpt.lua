-- Lazy
return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        local home = vim.fn.expand("$HOME")
        local cmd = "gpg --decrypt ".. home .. "/Desktop/chatgpt_secret.gpg"

        require("chatgpt").setup({
            api_key_cmd = cmd,
            openai_params = {
                model = "gpt-4o",
                max_tokens = 4096,
            }
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
    }
}
