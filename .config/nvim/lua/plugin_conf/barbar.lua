local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
	print('barbar is not working. Skipping...')
	return
end

-- Set barbar's options
bufferline.setup {
  -- Enable/disable animations
  animation = true,
}

