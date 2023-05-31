local configs = require("nvim-treesitter.configs")
configs.setup {
    -- List of supported languages is at https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    ensure_installed = {
        "python", "c", "ruby", "bash", "go", "dockerfile", "json", "lua",
        "markdown", "sql", "yaml"
    },
    sync_install = false,
    ignore_install = {""}, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {""}, -- list of language that will be disabled
        additional_vim_regex_highlighting = true

    },
    indent = {enable = true, disable = {"yaml"}}
}
