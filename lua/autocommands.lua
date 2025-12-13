vim.api.nvim_create_augroup('filetype-override', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Override styles for yaml-specific quirks',
    pattern = 'yaml',
    group = 'filetype-override',
    callback = function (context)
        vim.api.nvim_buf_set_var(context.buf, 'tabstop', 2)
        vim.api.nvim_buf_set_var(context.buf, 'softtabstop', 2)
        vim.api.nvim_buf_set_var(context.buf, 'shiftwidth', 2)
        vim.api.nvim_buf_set_var(context.buf, 'expandtab', true)
    end
})

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Open help window vertically',
    group = 'filetype-override',
    pattern = 'help',
    -- TODO is there a lua native equivalent?
    command = 'wincmd H'
})

vim.api.nvim_create_autocmd('BufNew', {
    desc = 'Angular local keybinds',
    -- TODO I feel like a FileType autocmd would be more correct but probably
    -- needs a plugin for better angular FT support
    pattern = {
        '*.component.html',
        '*.component.ts',
        '*.component.spec.ts',
        '*.component.scss'
    },
    group = 'filetype-override',
    callback = function (context)
        vim.keymap.set('n', '<localleader>gc',
                       require('commands').angular_goto_component,
                       {desc = 'Goto Angular component',
                        buffer = context.buf})
        vim.keymap.set('n', '<localleader>gt',
                       require('commands').angular_goto_template,
                       {desc = 'Goto Angular template',
                        buffer = context.buf})
        vim.keymap.set('n', '<localleader>gs',
                       require('commands').angular_goto_style,
                       {desc = 'Goto Angular style',
                        buffer = context.buf})
        vim.keymap.set('n', '<localleader>gu',
                       require('commands').angular_goto_spec,
                       {desc = 'Goto Angular unit tests',
                        buffer = context.buf})
    end
})

--

vim.api.nvim_create_augroup('user', { clear = true })

-- For some reason, setting opt.mouse too early seems to have no effect
vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Deferred enable mouse mode',
    group = 'user',
    callback = function ()
        vim.o.mouse = 'a'
    end
})

-- If writing a file in a directory that doesn't exist yet, this will create
-- the directory for you.
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Create directory for buffer if it does not already exist',
    group = 'user',
    callback = function (context)
        vim.fn.mkdir(vim.fn.fnamemodify(context.file, ':p:h'), 'p')
    end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight yanked text',
    group = 'user',
    callback = function ()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end
})

vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Resize splits when terminal is resized',
    group = 'user',
    command = 'wincmd ='
})

vim.api.nvim_create_autocmd('BufRead', {
    desc = 'CD to nearest project root',
    group = 'user',
    callback = function (context)
        -- Ignore special buffers (those with buftype set)
        local buftype = vim.api.nvim_get_option_value('buftype', {buf = context.buf})
        if buftype ~= '' then
            return
        end

        local rootfiles = {
            '.git',
            'Cargo.toml',
            -- Monorepos make this a questionable root marker
            --'package.json'
        }

        local currentfile = vim.api.nvim_buf_get_name(context.buf)
        if currentfile == '' then
            return
        end

        local start = vim.fs.dirname(currentfile)
        local matches = vim.fs.find(rootfiles, {
            path = start,
            upward = true,
            stop = os.getenv('HOME'),
            limit = 1
        })

        if #matches == 0 then
            return
        end

        local newroot = vim.fs.dirname(matches[1])
        vim.api.nvim_set_current_dir(newroot)
    end
})

--
vim.api.nvim_create_augroup('active-cursorline', { clear = true })
vim.api.nvim_create_autocmd('WinEnter', {
    desc = 'Enable cursorline on active window',
    group = 'active-cursorline',
    callback = function ()
        local windowid = vim.api.nvim_get_current_win()
        vim.api.nvim_set_option_value('cursorline', true, {
            scope = 'local',
            win = windowid
        })
    end
})

vim.api.nvim_create_autocmd('WinLeave', {
    desc = 'Disable cursorline on inactive window',
    group = 'active-cursorline',
    callback = function ()
        local windowid = vim.api.nvim_get_current_win()
        vim.api.nvim_set_option_value('cursorline', false, {
            scope = 'local',
            win = windowid
        })
    end
})

-- LSP ------------------------------------------------------------------------

vim.api.nvim_create_augroup('lsp.extras', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP capability-based functions',
    group = 'lsp.extras',
    callback = function (event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        -- TODO setup more robust aggregate capability detection for buffers
        -- with multiple clients attached

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            vim.api.nvim_create_augroup('lsp.highlight', {})
            vim.api.nvim_clear_autocmds({ group = 'lsp.highlight', buffer = event.buf })
            vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
                group = 'lsp.highlight',
                buffer = event.buf,
                callback = function ()
                    vim.lsp.buf.document_highlight()
                end
            })
            vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
                group = 'lsp.highlight',
                buffer = event.buf,
                callback = function ()
                    vim.lsp.buf.clear_references()
                end
            })
            vim.api.nvim_create_autocmd('LspDetach', {
                buffer = event.buf,
                once = true,
                callback = function ()
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = 'lsp.highlight',
                        buffer = event.buf
                    })
                end
            })
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting) then
            vim.keymap.set({'n', 'x'}, 'gQ',
                function () vim.lsp.buf.format({ async = true }) end,
                {buffer = event.buf, desc = 'Format entire buffer with LSP'})

            vim.api.nvim_create_autocmd('LspDetach', {
                buffer = event.buf,
                once = true,
                callback = function ()
                    vim.keymap.del({'n', 'x'}, 'gQ', { buffer = event.buf })
                end
            })
        end
    end
})

-- To enable inlay hints
--vim.api.nvim_create_autocmd('LspAttach', {
--    group = 'lsp.extras',
--    callback = function (args)
--        local client = vim.lsp.get_client_by_id(args.data.client_id)
--        if client.server_capabilities.inlayHintProvider then
--            vim.lsp.inlay_hint.enable(args.buf, true)
--        end
--    end
--})

-- Useful when I figure out how to set default folds better
--vim.api.nvim_create_autocmd('LspAttach', {
--    group = 'lsp.extras',
--    desc = 'LSP-specific capabilities/settings',
--    callback = function (event)
--        local client = vim.lsp.get_client_by_id(event.data.client_id)
--        if client and client:supports_method('textDocument/foldingRange') then
--            local window = vim.api.nvim_get_current_win()
--            vim.wo[window][0].foldmethod = 'expr'
--            vim.wo[window][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
--        end
--    end
--})
--vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })
