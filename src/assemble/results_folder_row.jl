results_folder_row = html_div(
    className = "row m-1",
    [
        html_div(className = "col", [html_label("Results folder name:")]),
        html_div(
            className = "col",
            [
                DashCoreComponents.dcc_input(
                    value = "RESULTS",
                    className = "form-control",
                    type = "text",
                    id = "results_folder_txt",
                ),
            ],
        ),
    ],
)
