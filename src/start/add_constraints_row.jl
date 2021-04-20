add_constraints_row = html_div(
    className = "row m-1",
    [
        html_div(
            className = "col",
            [
                html_div(
                    className = "row m-1",
                    [
                        html_label("Constraints file name:"),
                        dcc_input(
                            id = "constraints_file_txt",
                            value = "constraints.csv",
                            className = "form-control",
                            type = "text",
                        ),
                    ],
                ),
                html_div(
                    className = "row m-1",
                    [
                        html_label("Constraints separator:"),
                        dcc_input(
                            id = "constraints_file_delim_txt",
                            value = ";",
                            className = "form-control",
                            type = "text",
                        ),
                    ],
                ),
            ],
        ),
    ],
)
