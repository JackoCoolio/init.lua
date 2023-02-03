M = {}

function M.is_git()
    local repo_dir = vim.fn.system("git rev-parse --show-toplevel 2> /dev/null | tr -d '\n'")
    return repo_dir ~= ""
end

---Returns an iterator of the lines in `s`, without line-endings.
function M.lines(s)
    local pos = 1
    return function()
        if not pos then return nil end
        local p1, p2 = string.find(s, "\r?\n", pos)
        local line
        if p1 then
            line = s:sub(pos, p1 - 1)
            pos = p2 + 1
        else
            line = s:sub(pos)
            pos = nil
        end
        return line
    end
end

---Indents each line in `s` by `n` spaces.
function M.indent(s, n)
    local out = ""
    local margin = ""
    for _ = 1, n do
        margin = margin .. " "
    end
    for line in M.lines(s) do
        out = out .. margin .. line .. "\n"
    end
    return out
end

---Formats the given object into a pretty representation and returns the
---resulting string.
function M.dump(o, n)
    if n == nil then n = 2 end

    if type(o) == "table" then
        local s = "{\n"
        local inner = ""
        for k, v in pairs(o) do
            if type(k) ~= "number" then k = '"' .. k .. '"' end
            inner = inner .. "[" .. k .. "] = " .. M.dump(v, n) .. ",\n"
        end
        inner = M.indent(inner, n)
        s = s .. inner
        return s .. "}"
    else
        return tostring(o)
    end
end

return M
