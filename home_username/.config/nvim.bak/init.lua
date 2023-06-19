vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=

set nohlsearch

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <leader>ic :IcedConnect<cr>
nmap <leader>it :IcedStdoutBufferToggle<cr>
nmap <leader>il :IcedStdoutBufferClear<cr>
nnoremap <silent> <leader>ia :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> <leader>in :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> <leader>if :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>
]])

local dap = require('dap')

dap.adapters.godot = {
    type = "server",
    host = '127.0.0.1',
    port = 6006,
}

dap.configurations.gdscript = {
    {
        type = "godot",
        request = "launch",
        name = "Launch scene",
        project = "${workspaceFolder}",
        launch_scene = true,
    }
}

-- uncomment for vertical monitor setup
--require('telescope').setup {
    --defaults = {
        --layout_strategy = "vertical",
        --sorting_strategy = "ascending",
        --layout_config = {
            --height = 0.95,
            --prompt_position = 'top',
        --},
    --}
--}
