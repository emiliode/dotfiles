vim.g.VimuxRunnerType = "window"

Cargo_run = function()
    vim.fn.VimuxInterruptRunner()
    vim.fn.VimuxRunCommand("cargo run | bunyan")
end
Cargo_test = function()
    vim.fn.VimuxInterruptRunner()
    vim.fn.VimuxRunCommand("cargo test | bunyan")
end

Cargo_run_tests = function(test_name)
    local path = vim.fn.expand('%:r')
    if vim.fn.match(path, '^src/') ~= -1 then
        local parts = vim.fn.split(path, '/')
        local filtered_parts = vim.fn.filter(parts, 'v:val !~# "mod" && v:val !~# "src"')
        local module_path = vim.fn.join(filtered_parts, '::')

        if module_path == # 'lib' or module_path == # 'main' then
            vim.fn.VimuxRunCommand('clear &&' .. ' cargo test tests::' .. test_name)
        else
            vim.fn.VimuxRunCommand('clear &&' .. ' cargo test ' .. module_path .. '::tests::' .. test_name)
        end
    end
    if vim.fn.match(path, '^tests/') ~= 1 then 
        local parts = vim.fn.split(path, '/')
        if #parts > 2 then
            local sub_module = parts[2]
            local module_path = ""
            for i = 3, #parts do
                print("test"..i)
                print(parts[i])
                module_path = module_path .. parts[i] .. "::"
            end
            module_path =  module_path .. test_name
            print(module_path)
            vim.fn.VimuxRunCommand('clear &&' .. ' cargo test --test ' .. sub_module .. " " .. module_path)


        else
            print(dump(parts))
        end
    end

end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
Cargo_run_focused_test = function()
    local test_line = vim.fn.search('#[test', 'bs')

    if test_line == 0 then
        test_line = vim.fn.search('#[tokio::test', 'bs')
        if test_line == 0 then
            return
        end
    end

    local line = vim.fn.getline(test_line + 1)
    local test_name_raw = vim.fn.split(line, ' fn ')[2]
    if test_name_raw == nil then
        test_name_raw = vim.fn.split(line, ' fn ')[2]
    end
    local test_name = vim.fn.split(test_name_raw, '(')[1]
    print("raw" .. test_name_raw)
    print("not raw" .. test_name)
    Cargo_run_tests(test_name)
end

vim.keymap.set("n", "<leader>r", Cargo_run, {})
vim.keymap.set("n", "<leader>t", Cargo_test, {})
vim.keymap.set("n", "<leader>tf", Cargo_run_focused_test, {})
