local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print('null-ls is not working. Skipping...')
    return
end


local sources = {
    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
}

null_ls.setup {
    sources = sources,
}
