include("load_settings_row.jl")
input_card_body = html_div(
    className = "col",
    children = vcat(
        create_input_settings_fields(),
        insert_row("or", append_to_class_name = " text-center w100"),
        insert_row(
            [
                dcc_upload(
                    id = "upload_settings",
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
                                "Select settings file",
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
            "Settings file not uploaded.",
            append_to_class_name = " w100",
            id = "upload_settings_lbl",
        ),
        insert_row(
            insert_col(
                html_button(
                    id = "start_btn",
                    className = "btn btn-primary",
                    children = "Submit",
                    n_clicks = 0,
                ),
                append_to_class_name = " w-100 text-center",
            ),
            append_to_class_name = " w-100",
        ),
        # html_p(
        #     id = "wd_div",
        #     className = " d-none",
        #     ""
        # )

    ),
)
start_tab = dcc_tab(
    label = "Create model",
    children = [
        dcc_store(
            id = "model_store_start",
            storage_type = "memory",
            clear_data = false,
            data = "",
        ),
        html_div(id = "model_log_start", style = (display = "hidden"), children = ""),
        html_div(
            className = "container-fluid",
            [
                insert_row([
                    insert_col(
                        insert_card(input_card_body; card_id = "start_card"),
                        append_to_class_name = "-md-12 align-self-center",
                    ),
                ],),
            ],
        ),
    ],
)
