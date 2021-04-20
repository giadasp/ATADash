function insert_row(children; append_to_class_name = "", kwargs...)
    html_div(children; className = "row m-1" * append_to_class_name, kwargs...)
end

function insert_col(children; append_to_class_name = "", kwargs...)
    html_div(children; className = "col" * append_to_class_name, kwargs...)
end
