local json = require("json")

function Writer(filedata)
    local source_data = json.decode(filedata)

    if not (source_data.name == "_head.html" and source_data.name == "_tail.html")
    then
        source_data.content = source_data.content .. '\n<br><a href="/">&larr; back</a>'
    end

    return json.encode(source_data)
end
