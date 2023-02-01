function IsGit()
    local repo_dir = vim.fn.system("git rev-parse --show-toplevel 2> /dev/null | tr -d '\n'")
    return repo_dir ~= ""
end
