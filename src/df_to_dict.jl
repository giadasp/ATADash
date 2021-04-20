function df_to_dict(df::DataFrames.DataFrame)
    columns = map(
        n -> Dict(
            "name" => string(n),
            "id" => string(n),
            "type" => df_to_dict_type_convert(typeof(df[1, n])),
        ),
        names(df),
    )
    data = map(r -> Dict(names(df)[c] => df[r, c] for c = 1:size(df, 2)), 1:size(df, 1))
    return columns, data
end

function dict_to_constraints(dict)
    df = DataFrame(
        group = Int64.(floor.(parse.(Float64, map(d -> string(d[:group]), dict)))),
        var = string.(map(d -> d[:var], dict)),
        value = string.(map(d -> d[:value], dict)),
        min = parse.(Float64, map(d -> string(d[:min]), dict)),
        max = parse.(Float64, map(d -> string(d[:max]), dict)),
        weight = parse.(Float64, map(d -> string(d[:weight]), dict)),
    )
    return df
end

function dict_to_overlap_matrix(dict)
    ol_max = zeros(size(dict, 1), size(dict, 1))
    for d = 1:size(dict, 1)
        ol_max[d, :] = vcat(Int64.(floor.(parse.(Float64, string.(values(dict[d])))))...)
    end
    return ol_max
end

function dict_to_df(data)
    df = DataFrame()
    n_row = size(data, 1)
    for key in keys(data[1])
        df[!, Symbol(key)] = map(i -> begin
            data_i = data[i][key]
            if !isnothing(data_i)
                data_i
            else
                missing
            end
        end, 1:n_row)
    end
    return df
end
