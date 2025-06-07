return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })
    vim.keymap.set('n','<leader>ue','<C-w>h')
  end,
}

