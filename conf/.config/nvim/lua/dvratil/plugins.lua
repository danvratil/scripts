-- Bootstrap the package manager, no need to install everything separately.

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command 'packadd packer.nvim'
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'   -- Packer can manage itself

    -- Developer tools
    use 'tpope/vim-fugitive'	-- Git support
    use 'lewis6991/gitsigns.nvim'   -- inline git hints
    use {
        'kyazdani42/nvim-tree.lua',  -- NERDTree alternative
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, file icons
        }
    }

    -- General
    use 'folke/which-key.nvim'

    -- General Programming
    use 'lukas-reineke/indent-blankline.nvim'
    use 'ntpeters/vim-better-whitespace'
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig' -- default configurations for various LSPs
    use 'udalov/kotlin-vim' -- kotlin highlighting

    -- Autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Tools
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim', -- Utility functions for Lua
            'nvim-treesitter/nvim-treesitter' -- Optional
        }
    }
    use {
        'https://gitlab.com/ivan-cukic/nvim-telescope-zeal-cli',
        requires = {
            'rktjmp/hotpot.nvim', -- fennel programming language support
            'nvim-telescope/telescope.nvim'
        }
    }


    -- Look & Feel
    use {
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        after = 'github-nvim-theme',
        requires = {
            requires = {
                'kyazdani42/nvim-web-devicons', opt = true
            }
        },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'github_dimmed'
                }
            }
        end
    }
    use {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                theme_style = 'dimmed',
                dark_sidebar = false,
                dark_float = true
            })
        end
    }
end)
