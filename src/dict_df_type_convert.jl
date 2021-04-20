function df_to_dict_type_convert(type::Type)
    if type == String
        return "text"
    elseif (type == Float64) || (type == Int64)
        return "numeric"
    end
end

function dict_to_df_type_convert(type::String)
    if type == "text"
        return String
    elseif type == "numeric"
        return Float64
    end
end
