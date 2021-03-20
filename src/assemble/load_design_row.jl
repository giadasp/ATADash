load_design_row = html_div(
    className = "row m-1",
    [
        html_div(className = "col", [html_label("Starting design file:")]),
        html_div(
            className = "col",
            [
                DashCoreComponents.dcc_input(
                    value = "design.csv",
                    className = "form-control",
                    type = "text",
                    id = "starting_design_txt",
                ),
            ],
        ),
    ],
)
