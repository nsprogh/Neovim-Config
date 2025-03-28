return {
    -- use a release tag to download pre-built binaries
    'saghen/blink.cmp', version = 'v0.*',
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
        enabled = function ()
            return vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false
        end,

        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = { preset = 'super-tab' },

        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = true,

            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- experimental signature help support
        signature = { enabled = true },

        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = true
                }
            },
            trigger = {
                show_on_insert_on_trigger_character = false,

                -- For use with the 'super-tab' keymaps so that hitting tab to
                -- go to the next entry in the snippet doesn't proc completion
                show_in_snippet = false
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500
            }
        },

        fuzzy = {
            max_typos = function (_) return 0 end
        }
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefining it
    opts_extend = { "sources.completion.enabled_providers" }
}
