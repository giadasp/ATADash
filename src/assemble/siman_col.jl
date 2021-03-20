siman_col = html_div(
    className = "col",
    [
        html_h3("SimAn solver", className = "text-center"),
        html_div(
            className = "row m-1",
            [
                html_div(
                    className = "col",
                    [html_label("Maximum time (in seconds):")],
                ),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 100,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 10000,
                            step = 10,
                            id = "max_time_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(className = "col", [html_label("Starting temperature:")]),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 0.1,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 1000,
                            step = 0.00001,
                            id = "start_temp_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(
                    className = "col",
                    [html_label("Geometric temp decreasing:")],
                ),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 0.1,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 1000,
                            step = 0.00001,
                            id = "geom_temp_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(className = "col", [html_label("Items to sample:")]),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 1,
                            className = "form-control",
                            type = "number",
                            min = 1,
                            max = 1000,
                            step = 1,
                            id = "n_item_sample_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(className = "col", [html_label("Tests to sample:")]),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 1,
                            className = "form-control",
                            type = "number",
                            min = 1,
                            max = 1000,
                            step = 1,
                            id = "n_test_sample_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(className = "col", [html_label("Maximum convergence:")]),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 10,
                            className = "form-control",
                            type = "number",
                            min = 2,
                            max = 1000,
                            step = 1,
                            id = "max_conv_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(className = "col", [html_label("Verbosity:")]),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_dropdown(
                            value = 1,
                            options = [
                                (label = "minimal", value = 1),
                                (label = "detailed", value = 2),
                            ],
                            id = "verbosity_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(
                    className = "col",
                    [html_label("Optimality/Feasibility balancer:")],
                ),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 0.1,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 1,
                            step = 0.01,
                            id = "opt_feas_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(className = "col", [html_label("#Fill-up phases:")]),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 1,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 2000,
                            step = 1,
                            id = "n_fill_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(
                    className = "col",
                    [html_label("#Feasibility neighbourhoods:")],
                ),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 1,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 2000,
                            step = 1,
                            id = "feas_nh_txt",
                        ),
                    ],
                ),
            ],
        ),
        html_div(
            className = "row m-1",
            [
                html_div(
                    className = "col",
                    [html_label("#Optimality neighbourhoods:")],
                ),
                html_div(
                    className = "col",
                    [
                        DashCoreComponents.dcc_input(
                            value = 100,
                            className = "form-control",
                            type = "number",
                            min = 0,
                            max = 2000,
                            step = 1,
                            id = "opt_nh_txt",
                        ),
                    ],
                ),
            ],
        ),
    ],
)
