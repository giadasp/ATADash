load_design_row = insert_row([
    insert_col([html_label("Starting design file:")]),
    insert_col([
        dcc_input(
            value = "design.csv",
            className = "form-control",
            type = "text",
            id = "starting_design_txt",
        ),
    ],),
],)
