load_settings_row = html_div(
    className = "row m-1",
    [
        html_div(
            className = "col",
            [
                html_div(
                    className = "row m-1",
                    [
                        html_label(
                            "Working directory (absolute path):",
                            className = "mr-1",
                        ),
                        dcc_input(
                            id = "folder_txt",
                            value = pwd(),
                            type = "text",
                            className = "form-control",
                        ),
                    ],
                ),
                html_div(
                    className = "row m-1",
                    [
                        html_label("Settings file name:"),
                        dcc_input(
                            id = "settings_file_txt",
                            value = "settingsATA maximin.jl",
                            className = "form-control",
                            type = "text",
                        ),
                    ],
                ),
                html_div(
                    className = "row m-1",
                    [
                        html_label("Item pool file:", id = "pool_lbl"),
                        dcc_input(
                            id = "bank_txt",
                            value = "bank.csv",
                            className = "form-control",
                            type = "text",
                        ),
                    ],
                ),
                html_div(
                    className = "row m-1",
                    [
                        html_label("Bank separator:", id = "delim_bank_lbl"),
                        dcc_input(
                            id = "bank_delim_txt",
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
