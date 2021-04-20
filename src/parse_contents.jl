function parse_input_settings(contents, filename, date)
    content_mime, content_string = split(contents, ",")
    try
        if occursin(".txt", filename)
            i_s = eval(Meta.parse(String(base64decode(content_string))))
            #i_s = ATA.read_settings_file(filename)
        else
            error("")
        end
        return html_div([string(filename, " successfully uploaded.")]),
        from_i_s_to_fields(i_s)
    catch e
        return html_div([
            "There was an error processing this file. It must have the extension \"txt\" and contain an ATA.InputSettings object",
        ]),
        create_input_settings_fields()
    end

end

function parse_bank(contents, filename, date)
    content_mime, content_string = split(contents, ",")
    try
        if occursin(".csv", filename)
            df = CSV.read(IOBuffer(base64decode(content_string)), DataFrames.DataFrame)
            #i_s = ATA.read_settings_file(filename)
        else
            error("")
        end
        columns, data = df_to_dict(df)
        return html_div([string(filename, " successfully uploaded.")]), columns, data

    catch e
        return html_div([
            "There was an error processing this file. It must have the extension \"csv\" and values must be separated by \";\" .",
        ]),
        throw(PreventUpdate()),
        throw(PreventUpdate())
    end
end


function parse_overlap(contents, filename, date)
    content_mime, content_string = split(contents, ",")
    try
        if occursin(".csv", filename)
            df = CSV.read(
                IOBuffer(base64decode(content_string)),
                DataFrames.DataFrame,
                header = false,
            )
            rename!(df, [string("t_", t) for t = 1:size(df, 1)])
        else
            error("")
        end
        columns, data = df_to_dict(df)
        return html_div([string(filename, " successfully uploaded.")]), columns, data

    catch e
        return html_div([
            "There was an error processing this file. It must have the extension \"csv\" and contain the items' data.",
        ]),
        throw(PreventUpdate()),
        throw(PreventUpdate())
    end
end
