local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
	print('barbar is not working. Skipping...')
	return
end

-- Set barbar's options
bufferline.setup {
  -- Enable/disable animations
  animation = true,

  -- Icons in barbar
  icons = {
    -- Configure the base icons on the bufferline.
    buffer_index = true, -- Index according to visual index on the screen not the background number of buffer
  },

  sidebar_filetypes = {'NvimTree', 'undotree'},
}

