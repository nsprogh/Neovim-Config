return {
    -- use a release tag to download pre-built binaries
    'saghen/blink.cmp', version = 'v1.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- Not sure what this is for but maybe it's not needed anymore?
        --enabled = function ()
        --    return vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false
        --end,

        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- experimental signature help support
        signature = { enabled = true },

        completion = {
            accept = {
                auto_brackets = { enabled = true }
            },
            trigger = {
                show_on_insert_on_trigger_character = false
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500
            }
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        cmdline = {
            enabled = false
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            -- Typo correction may no longer be needed with exact matches being
            -- prioritized
            --max_typos = function (_) return 0 end,
            -- Always prioritize exact matches
            sorts = {
                'exact',
                -- defaults
                'score',
                'sort_text',
            }
        }
    },
    opts_extend = { "sources.default" }
}
