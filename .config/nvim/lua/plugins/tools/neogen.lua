return {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    version = "*",
    config = function()
        require("neogen").setup({
            enabled = true,         --if you want to disable Neogen
            input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation

            languages = {
                python = {
                    template = {
                        annotation_convention = "numpydoc"
                        -- for a full list of annotation_conventions, see supported-languages below,
                        -- for more template configurations, see the language's configuration file in configurations/{lang}.lua
                    }
                },
            }
        })
    end
}
