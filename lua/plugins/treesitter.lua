require 'nvim-treesitter.install'.prefer_git = true
require 'nvim-treesitter.install'.compilers = { "clang" }

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c" , "cpp" , "lua", "vim", "vimdoc", "query" , "python" , "javascript" , "typescript" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}

--- HTML autotags ---
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

