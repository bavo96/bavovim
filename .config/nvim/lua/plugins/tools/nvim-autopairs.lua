-- auto create pairs for special characters
return {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end
}
