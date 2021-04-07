select_solver_row = html_div(
    className = "row m-1",
    [
        html_div(className = "col", [html_label("Solver (siman or jump):")]),
        html_div(
            className = "col",
            [
                DashCoreComponents.dcc_dropdown(
                    value = "siman",
                    id = "solver_txt",
                    options = [
                        (label = "siman", value = "siman"),
                        (label = "jump", value = "jump"),
                    ],
                ),
            ],
        ),
    ],
)
