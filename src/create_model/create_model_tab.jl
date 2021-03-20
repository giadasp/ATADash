include("add_constraints_row.jl")
include("add_flags_row.jl")
include("add_overlap_row.jl")
include("load_settings_row.jl")

create_model_tab = dcc_tab(
    label = "Create model",
    children = [
        html_div(
            className = "container-fluid",
            [
                html_div(
                    className = "row m-3",
                    [
                        html_div(
                            className = "col-md-12 align-self-center",
                            [
                                html_div(
                                    className = "card h-100",
                                    [
                                        html_div(
                                            className = "card-body",
                                            [
                                                html_div(
                                                    className = "row m-1",
                                                    [
                                                            html_div(
                                                                className = "col",
                                                                [
                                                                    load_settings_row,
                                                                    add_constraints_row,
                                                                    add_overlap_row,
                                                                    add_flags_row,
                                                                ],
                                                            ),
                                                            html_div(
                                                                className = "col",
                                                                [
                                                                    html_div(
                                                                        className = "row",
                                                                        [
                                                                            html_div(
                                                                                id = "create_model_lbl",
                                                                                className = "h-100 w-100",
                                                                            ),
                                                                        ]
                                                                    ),
                                                                ],
                                                            ),
                                                    ],
                                                ),
                                                html_div(
                                                    className = "row",
                                                    [
                                                        html_div(
                                                            className = "col text-center",
                                                            [
                                                                html_button(
                                                                    id = "create_model_btn",
                                                                    className = "btn btn-primary",
                                                                    children = "submit",
                                                                    n_clicks = 0,
                                                                ),
                                                            ]
                                                        ),
                                                        html_p(
                                                            id = "wd_div",
                                                            className = " d-none",
                                                            ""
                                                        )
                                                    ],
                                                )
                                            ]
                                        )
                                    ]
                                )
                            ]
                        )
                    ]
                ),
            ],
        ),
    ],
)
