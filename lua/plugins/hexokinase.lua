return {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',            -- Compile the binary on install
    config = function()
        vim.cmd('HexokinaseToggle')     -- Optionally toggle Hexokinase on startup

        -- Set up Hexokinase highlighting patterns
        vim.g.Hexokinase_optInPatterns = {
            'full_hex',
            'triple_hex',       -- Supports RGB
            'rgba',             -- Supports RGBA
            'colour_names',     -- Optional: supports named colors
        }
    end,
}
