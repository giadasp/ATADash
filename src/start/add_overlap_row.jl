add_overlap_row = html_div(
    className = "row m-1",
    [
        html_div(
            className = "col",
            [
                html_div(
                    className = "row m-1",
                    [
                        html_label("Overlap matrix file name:"),
                        dcc_input(
                            id = "overlap_file_txt",
                            value = "overlap_matrix.csv",
                            className = "form-control",
                            type = "text",
                        ),
                    ],
                ),
                html_div(
                    className = "row m-1",
                    [
                        html_label("Overlap matrix separator:"),
                        dcc_input(
                            id = "overlap_file_delim_txt",
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
