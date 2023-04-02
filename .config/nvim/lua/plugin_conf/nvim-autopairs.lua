local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')

if not status_ok then
	print('nvim-autopairs is not working. Skipping...')
	return
end

nvim_autopairs.setup {
}
