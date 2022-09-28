vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=

set nohlsearch

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
]])

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
