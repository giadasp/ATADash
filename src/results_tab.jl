results_tab = dcc_tab(
    className = "nav-link disabled",
    id = "results_tab",
    label = "Results",
    children = [
        html_div(
            className = "container-fluid",
            [
                insert_row(
                    append_to_class_name = "-md-12 justify-content-center m-3",
                    [
                        insert_col(
                            append_to_class_name = "-md-12",
                            [
                                insert_card(
                                    [html_pre(children = [""], id = "results_lbl")],
                                    card_id = "results_card",
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)
