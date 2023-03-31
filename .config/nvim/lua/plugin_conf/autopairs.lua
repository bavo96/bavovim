local status_ok, autopairs = pcall(require, 'autopairs')

if not status_ok then
	print('autopairs is not working. Skipping...')
	return
end

autopairs.setup {
}
