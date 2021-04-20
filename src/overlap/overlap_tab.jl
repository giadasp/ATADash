
overlap_tab = dcc_tab(
    id = "overlap_tab",
    className = "nav-link disabled",
    label = "Item overlap",
    children = [
        dcc_store(
            id = "model_store_overlap",
            storage_type = "memory",
            clear_data = false,
            data = "",
        ),
        html_div(id = "model_log_overlap", style = (display = "hidden"), children = ""),
        html_div(
            className = "container-fluid",
            insert_row(
                insert_col(
                    insert_card(
                        insert_col([
                            insert_row([
                                html_label("Number of rows (columns):"),
                                dcc_input(
                                    id = "overlap_rows",
                                    value = 0,
                                    className = "form-control",
                                    type = "number",
                                ),
                            ],),
                            insert_row(
                                dash_datatable(
                                    id = "overlap_table",
                                    editable = true,
                                    row_deletable = true,
                                    page_size = 100,
                                    columns = df_to_dict(DataFrame(t1 = [0]))[1],
                                    data = df_to_dict(DataFrame(t1 = [0]))[2],
                                    style_cell = (
                                        "textAlign" => "center",
                                        "fontSize" => 16,
                                    ),
                                ),
                            ),
                            insert_row(
                                [
                                    dcc_upload(
                                        id = "upload_overlap",
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
                                                    "Select overlap file",
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
                                "overlap file not uploaded.",
                                append_to_class_name = " w100",
                                id = "upload_overlap_lbl",
                            ),
                            insert_row(
                                insert_col(
                                    html_button(
                                        id = "load_overlap_btn",
                                        className = "btn btn-primary",
                                        children = "Add overlap to model",
                                        n_clicks = 0,
                                    ),
                                    append_to_class_name = " w-100 text-center",
                                ),
                                append_to_class_name = " w-100",
                            ),
                        ],);
                        card_id = "overlap_card",
                    ),
                ),
            ),
        ),
    ],
)
