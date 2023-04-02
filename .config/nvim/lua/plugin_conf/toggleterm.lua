local status_ok, toggleterm = pcall(require, 'toggleterm')

if not status_ok then
	print('toggleterm is not working. Skipping...')
	return
end

require('toggleterm').setup{
}

