vim.keymap.set("n", "<leader>gs", function()
	if IsGit() then
		vim.cmd.Git()
	else
		print("error: not in git repository")
	end
end)
