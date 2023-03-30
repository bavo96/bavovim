local status_ok, comment = pcall(require, 'Comment')

if not status_ok then
  print('Comment is not working. Skipping...')
  return
end

comment.setup()
