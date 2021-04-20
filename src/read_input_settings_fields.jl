function read_input_settings_fields(input_settings_fields)
    i_s = ATA.InputSettings()
    map(
        f -> begin
            input = f.props.children[2].props
            if typeof(getfield(i_s, Symbol(input.name))) == String
                setfield!(i_s, Symbol(input.name), string(input.value))
            else
                setfield!(
                    i_s,
                    Symbol(input.name),
                    typeof(getfield(i_s, Symbol(input.name)))(
                        eval(Meta.parse(string(input.value))),
                    ),
                )
            end
        end,
        input_settings_fields,
    )

    return i_s
end

function Core.String(n::Nothing)
    return ""
end
