log_tab = dcc_tab(
    id = "model_log_tab",
    className = "nav-link disabled",
    label = "Log",
    children = [
        html_div(
            className = "container-fluid",
            [
                insert_row(
                    append_to_class_name = " m-3",
                    [
                        insert_col(
                            append_to_class_name = "md-12 align-self-center",
                            [
                                insert_card(
                                    [
                                        insert_row(
                                            "Model not initialized.";
                                            id = "model_log",
                                        ),
                                    ],
                                    card_id = "model_log_card",
                                ),
                                dcc_store(
                                    id = "model_store",
                                    storage_type = "memory",
                                    clear_data = false,
                                    data = ATADash.serialize_ata(),
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)
