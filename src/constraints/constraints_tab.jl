constraints_tab = dcc_tab(
    id = "constraints_tab",
    className = "nav-link disabled",
    label = "Constraints",
    children = [
        dcc_store(
            id = "model_store_constraints",
            storage_type = "memory",
            clear_data = false,
            data = "",
        ),
        html_div(
            id = "model_log_constraints",
            style = (display = "hidden"),
            children = "",
        ),
        html_div(
            className = "container-fluid",
            insert_row(
                insert_col(
                    insert_card(
                        insert_col([
                            insert_row([
                                dash_datatable(
                                    id = "constraints_table",
                                    editable = true,
                                    row_deletable = true,
                                    page_size = 20,
                                    columns = [
                                        Dict("name" => "group (Int64)", "id" => "group"),
                                        Dict(
                                            "name" => "column name (String)",
                                            "id" => "var",
                                        ),
                                        Dict("name" => "value (String)", "id" => "value"),
                                        Dict("name" => "min (Float64)", "id" => "min"),
                                        Dict("name" => "max (Float64)", "id" => "max"),
                                        Dict(
                                            "name" => "weight (Float64)",
                                            "id" => "weight",
                                        ),
                                    ],
                                    data = [
                                        Dict(
                                            "group" => "1",
                                            "var" => "column_name",
                                            "value" => "value",
                                            "min" => "0.0",
                                            "max" => "0.0",
                                            "weight" => "1.0",
                                        ),
                                    ],
                                    style_cell = (
                                        "textAlign" => "center",
                                        "fontSize" => 16,
                                    ),
                                ),
                            ]),
                            insert_row(
                                    html_button(
                                        id = "add_constraint_btn",
                                        className = "btn",
                                        children = "+",
                                        n_clicks = 0,
                                    )
                                ),
                            insert_row(
                                [
                                    dcc_upload(
                                        id = "upload_constraints",
                                        style = (
                                            width = "100%",
                                            lineHeight = "60px",
                                            textAlign = "center",
                                            margin = "10px",
                                        ),
                                        children = html_div(
                                            children = [
                                                "Drag and Drop or ",
                                                html_a(
                                                    "Select constraints file",
                                                    className = "card-link",
                                                    href = "#",
                                                ),
                                            ],
                                        ),
                                        multiple = false,
                                    ),
                                ],
                                style = (
                                    borderWidth = "1px",
                                    borderStyle = "dashed",
                                    borderRadius = "5px",
                                    textAlign = "center",
                                ),
                            ),
                            insert_row(
                                "constraints file not uploaded.",
                                append_to_class_name = " w100",
                                id = "upload_constraints_lbl",
                            ),
                            insert_row(
                                insert_col(
                                    html_button(
                                        id = "load_constraints_btn",
                                        className = "btn btn-primary",
                                        children = "Add constraints to model",
                                        n_clicks = 0,
                                    ),
                                    append_to_class_name = " w-100 text-center",
                                ),
                                append_to_class_name = " w-100",
                            ),
                        ],);
                        card_id = "constraints_card",
                    ),
                ),
            ),
        ),
    ],
)
