vim.cmd [[packadd packer.nvim]]

vim.api.nvim_create_user_command(
    'ReloadConfig',
    'source $MYVIMRC | PackerCompile',
    {}
)
local id = vim.api.nvim_create_augroup("MyGroup", {
    clear = true
})

vim.api.nvim_create_autocmd("BufWritePost",{
    group = id,
    pattern  = "packer.lua",
    callback = function(ev)
        vim.cmd.luafile("/home/emil/.config/nvim/lua/myconfig/packer.lua")
        vim.cmd.PackerCompile()
        vim.cmd.PackerSync()
    end
})

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'lunarvim/darkplus.nvim' }
    use 'christoomey/vim-tmux-navigator'
    use 'jiangmiao/auto-pairs'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use('nvim-treesitter/playground')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
