local status_ok, mason = pcall(require, 'mason')

if not status_ok then
    print('mason is not working. Skipping...')
    return
end

mason.setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }

}
