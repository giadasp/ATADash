include("siman_col.jl")
include("jump_col.jl")
include("parse_parameters.jl")
include("other_settings_row.jl")

assemble_tab = dcc_tab(
    id = "assemble_tab",
    className = "nav-link disabled",
    label = "Assemble!",
    children = [
        dcc_store(
            id = "model_store_assemble",
            storage_type = "memory",
            clear_data = false,
            data = "",
        ),
        html_div(id = "model_log_assemble", style = (display = "hidden"), children = ""),
        html_div(
            className = "container-fluid",
            [
                insert_row(
                    [
                        insert_col([
                            insert_card(
                                [
                                    insert_row([siman_col, jump_col]),
                                    other_settings_row,
                                    insert_row(
                                        insert_col(
                                            html_button(
                                                id = "assemble_btn",
                                                className = "btn btn-primary",
                                                children = "Assemble!",
                                                n_clicks = 0,
                                            ),
                                            append_to_class_name = " w-100 text-center",
                                        ),
                                        append_to_class_name = " w-100",
                                    ),
                                ],
                            ),
                        ],),
                    ],
                ),
            ],
        ),
    ],
)
