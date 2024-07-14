return {
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function() require('competitest').setup() end,
    },
    {
        'glepnir/template.nvim',
        cmd = { 'Template', 'TemProject' },
        config = function()
            require('template').setup({
                temp_dir = '~/Documents/templates',
            })
        end
    }
}
