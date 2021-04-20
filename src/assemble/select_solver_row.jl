select_solver_row = insert_row([
    insert_col([html_label("Solver (siman or jump):")]),
    insert_col([
        dcc_dropdown(
            value = "siman",
            id = "solver_txt",
            options = [
                (label = "siman", value = "siman"),
                (label = "jump", value = "jump"),
            ],
        ),
    ],),
],)
