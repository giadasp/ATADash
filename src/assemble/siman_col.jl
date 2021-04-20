siman_col = insert_col(
    id = "siman_parameters",
    [
        html_h3("SimAn solver", className = "text-center"),
        insert_row([
            insert_col([html_label("Maximum time (in seconds):")]),
            insert_col([
                dcc_input(
                    value = 100,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 10000,
                    step = 10,
                    id = "max_time_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Starting temperature:")]),
            insert_col([
                dcc_input(
                    value = 0.1,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 1000,
                    step = 0.00001,
                    id = "start_temp_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Geometric temp decreasing:")]),
            insert_col([
                dcc_input(
                    value = 0.1,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 1000,
                    step = 0.00001,
                    id = "geom_temp_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Items to sample:")]),
            insert_col([
                dcc_input(
                    value = 1,
                    className = "form-control",
                    type = "number",
                    min = 1,
                    max = 1000,
                    step = 1,
                    id = "n_item_sample_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Tests to sample:")]),
            insert_col([
                dcc_input(
                    value = 1,
                    className = "form-control",
                    type = "number",
                    min = 1,
                    max = 1000,
                    step = 1,
                    id = "n_test_sample_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Maximum convergence:")]),
            insert_col([
                dcc_input(
                    value = 10,
                    className = "form-control",
                    type = "number",
                    min = 2,
                    max = 1000,
                    step = 1,
                    id = "max_conv_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Verbosity:")]),
            insert_col([
                dcc_dropdown(
                    value = 1,
                    options = [
                        (label = "minimal", value = 1),
                        (label = "detailed", value = 2),
                    ],
                    id = "verbosity_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("Optimality/Feasibility balancer:")]),
            insert_col([
                dcc_input(
                    value = 0.1,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 1,
                    step = 0.01,
                    id = "opt_feas_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("#Fill-up phases:")]),
            insert_col([
                dcc_input(
                    value = 1,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 2000,
                    step = 1,
                    id = "n_fill_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("#Feasibility neighbourhoods:")]),
            insert_col([
                dcc_input(
                    value = 1,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 2000,
                    step = 1,
                    id = "feas_nh_txt",
                ),
            ],),
        ],),
        insert_row([
            insert_col([html_label("#Optimality neighbourhoods:")]),
            insert_col([
                dcc_input(
                    value = 100,
                    className = "form-control",
                    type = "number",
                    min = 0,
                    max = 2000,
                    step = 1,
                    id = "opt_nh_txt",
                ),
            ],),
        ],),
    ],
)
