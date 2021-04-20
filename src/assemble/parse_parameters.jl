function parse_parameters_siman(siman_col_children)
    inputs = Dict(
        begin
            input = e.props.children[2].props.children[1].props
            split(input.id, "_txt")[1] => input.value
        end for e in siman_col_children[2:end])
    return inputs
end

function parse_parameters_jump(children)
    inputs = Dict(
        begin
            e.props.children[2].props.children[1].props
            split(input.id, "_txt")[1] => input.value
        end for e in siman_col_children[2:end]
    )
    return inputs
end
