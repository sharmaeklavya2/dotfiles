function applyColorscheme(csName)
    local is_ok, _ = pcall(vim.cmd, "colorscheme " .. csName)
    if not is_ok then
        vim.notify("colorscheme " .. csName .. "not found!")
    end
end

function setBackground(jobResult)
    local theme = jobResult.stdout
    if theme == 'Light' then
        vim.o.background = 'light'
    elseif theme == 'Dark' then
        vim.o.background = 'dark'
    end
end

local jobResult = vim.system({"python3", "-c", "import darkdetect; print(darkdetect.theme(), end='')"}, {text = true}):wait()
setBackground(jobResult)
applyColorscheme('solarized')
