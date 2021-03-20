include("siman_col.jl")
include("jump_col.jl")
include("other_settings_row.jl")

assemble_tab = DashCoreComponents.dcc_tab(
    id = "assemble_tab",
    className = "nav-link disabled",
    label = "Assemble!",
    children = [
        html_div(
            className = "container-fluid",
            [
                html_div(
                    className = "row m-3",
                    [
                        html_div(
                            className = "col-md-12 align-self-center",
                            [
                                html_div(
                                    className = "card h-100",
                                    [
                                        html_div(
                                            className = "card-body",
                                            [
                                                html_div(
                                                    className = "row m-1",
                                                    [siman_col, jump_col],
                                                ),
                                                other_settings_row,
                                                html_div(
                                                    className = "row m-1",
                                                    [
                                                        html_div(
                                                            className = "col text-center",
                                                            html_button(
                                                                "assemble!";
                                                                id = "assemble_btn",
                                                                n_clicks = 0,
                                                                className = "btn btn-primary",
                                                            )
                                                        )
                                                    ],
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)
