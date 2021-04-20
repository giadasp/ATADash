results_folder_row = insert_row([
    insert_col([html_label("Results folder name:")]),
    insert_col([
        dcc_input(
            value = "results",
            className = "form-control",
            type = "text",
            id = "results_folder_txt",
        ),
    ],),
],)
