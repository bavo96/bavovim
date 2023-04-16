local status_ok, illuminate = pcall(require, 'illuminate')

if not status_ok then
    print('vim-illuminate is not working. Skipping...')
    return
end
