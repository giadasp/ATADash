results_tab = DashCoreComponents.dcc_tab(
    className = "nav-link disabled",
    id = "results_tab",
    label = "Results",
    children = [
        html_div(
            className = "container-fluid",
            [
                html_div(
                    className = "row-md-12 justify-content-center m-3",
                    [
                        html_div(
                            className = "col-md-12",
                            [
                                html_div(
                                    id = "results_card",
                                    className = "card",
                                    [
                                        html_div(
                                            className = "card-body",
                                            [html_pre(children = [""], id = "results_lbl")],
                                        ),
                                    ],
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)
