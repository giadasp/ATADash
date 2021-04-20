jump_col = insert_col(
    id = "jump_parameters",
    [
        html_h3("JuMP solver", className = "text-center"),
        insert_row([
            insert_col([html_label("Optimizer constructor:")]),
            html_div(
                className = "col",
                [
                    dcc_dropdown(
                        value = "Cbc",
                        id = "optimizer_constructor_txt",
                        options = [
                            (label = "Cbc", value = "Cbc"),
                            (label = "GLPK", value = "GLPK"),
                            (label = "CPLEX", value = "CPLEX"),
                            (label = "Gurobi", value = "Gurobi"),
                            (label = "KNITRO", value = "KNITRO"),
                            (label = "Xpress", value = "Xpress"),
                            (label = "Juniper", value = "Juniper"),
                            (label = "CPLEX", value = "CPLEX"),
                            (label = "MosekTools", value = "MosekTools"),
                            (label = "SCIP", value = "SCIP"),
                        ],
                    ),
                ],
            ),
        ],),
        insert_row([
            insert_col([html_label("Optimizer attributes:")]),
            insert_col([
                dcc_input(
                    value = "[(\"seconds\", 500), (\"logLevel\", 1)]",
                    className = "form-control",
                    type = "text",
                    id = "optimizer_attributes_txt",
                ),
            ],),
        ],),
    ],
)
