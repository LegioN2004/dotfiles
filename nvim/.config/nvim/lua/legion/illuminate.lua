-- default configuration
require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
        'nerdtree',
        'alpha',
        'netrw',
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
    min_count_to_highlight = 1,
    should_enable = function(bufnr) return true end,
    case_insensitive_regex = false,
})
