function from_i_s_to_fields(i_s::ATA.InputSettings)
    fields = fieldnames(typeof(i_s))
    return html_div(
        id = "input_settings_fields",
        map(
            f -> begin
                insert_row([
                    html_label(string(f, ": ")),
                    dcc_input(
                        id = string(f, "_txt"),
                        name = string(f),
                        value = "$(getfield(i_s, f))",
                        className = "form-control",
                        type = "text",
                    ),
                ],)
            end,
            fields,
        ),
    )
end

function create_input_settings_fields()
    return from_i_s_to_fields(ATA.InputSettings())
end

