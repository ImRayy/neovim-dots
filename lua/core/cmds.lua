local A = vim.api
local B = vim.b
local G = vim.g

-- Format cmds of conform.nvim
A.nvim_create_user_command("FormatOnSaveDisable", function(args)
  if args.bang then
    B.disable_autoformat = true
  else
    G.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

A.nvim_create_user_command("FormatOnSaveEnable", function()
  B.disable_autoformat = false
  G.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

A.nvim_create_user_command("RelativeNumber", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, {
  desc = "Toggle relativenumber",
})

-- Snacks.nvim: LSP-integrated file renaming for mini files
A.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})
