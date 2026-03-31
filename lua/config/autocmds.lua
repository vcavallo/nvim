-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:remove("t")
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatexpr = "" -- clear this so gq uses textwidth
    vim.schedule(function()
      vim.cmd("RenderMarkdown disable") -- disable "rendering" by default
    end)
    vim.diagnostic.enable(false, { bufnr = args.buf }) -- same for diagnostics
    vim.opt_local.spell = false
  end,
})
