local json = require("json")
local alvu = require("alvu")

ForFile = "index.md"

function Writer(filedata)
    local source_data = json.decode(filedata)
    local files = alvu.files("./pages")

    for fileIdx = 1, #files do
        local slug = files[fileIdx]:gsub("%.md", ""):gsub("%.html","")
        local name = slug:gsub("-", " "):lower()

        if not (name == "_head" or name == "_tail" or name == "index")
        then
            source_data.content = source_data.content .. "\n" .. "- [" .. name .. "](" .. slug .. ")"
        end


    end

    return json.encode(source_data)
end
