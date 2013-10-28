A Vim Plugin for Rubocop
========================

Runs the rubocop style checker on the current file or files in the current
directory on down. Rubocop config can specify which files to analyse.


Installation
------------

1. Install [pathogen](https://github.com/tpope/vim-pathogen) if you're not using it already.

2. Clone this repository into your bundle directory:

    git clone https://github.com/lad/vim-rubocop.git ~/.vim/bundle

3. If you want to use a specific config file set g:rubocop_config

    let g:rubocop_config = "~/git/dev/roux/etc/rubocop.yml"

4. Setup whatever shortcuts you want to invoke RubocopThis (current file) or RubocopAll.

    nnoremap    <leader>R       :RubocopThis<CR>
    nnoremap    <leader>T       :RubocopAll<CR>
