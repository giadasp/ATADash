bank_tab = dcc_tab(
    id = "bank_tab",
    className = "nav-link disabled",
    label = "Item Bank",
    children = [
        dcc_store(
            id = "model_store_bank",
            storage_type = "memory",
            clear_data = false,
            data = "",
        ),
        html_div(id = "model_log_bank", style = (display = "hidden"), children = ""),
        html_div(
            className = "container-fluid",
            insert_row(
                insert_col(
                    insert_card(
                        insert_col([
                            insert_row(
                                dash_datatable(
                                    id = "bank_table",
                                    editable = true,
                                    row_deletable = true,
                                    page_size = 20,
                                    columns = [
                                        Dict("name" => "id", "id" => "group"),
                                        Dict("name" => "a", "id" => "a"),
                                        Dict("name" => "b", "id" => "b"),
                                        Dict("name" => "category_1", "id" => "category_1"),
                                        Dict("name" => "friend_set", "id" => "unit"),
                                    ],
                                    data = [
                                        Dict(
                                            "id" => "1",
                                            "a" => "1.0",
                                            "b" => "0.0",
                                            "category_1" => "multiple_choice",
                                            "unit" => "A",
                                        ),
                                    ],
                                    style_cell = (
                                        "textAlign" => "center",
                                        "fontSize" => 16,
                                    ),
                                ),
                            ),
                            insert_row(
                                [
                                    dcc_upload(
                                        id = "upload_bank",
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
                                                    "Select bank file",
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
                                "Bank file not uploaded.",
                                append_to_class_name = " w100",
                                id = "upload_bank_lbl",
                            ),
                            insert_row(
                                insert_col(
                                    html_button(
                                        id = "load_bank_btn",
                                        className = "btn btn-primary",
                                        children = "Add item bank to model",
                                        n_clicks = 0,
                                    ),
                                    append_to_class_name = " w-100 text-center",
                                ),
                                append_to_class_name = " w-100",
                            ),
                        ],);
                        card_id = "bank_card",
                    ),
                ),
            ),
        ),
    ],
)
