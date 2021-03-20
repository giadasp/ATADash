include("load_design_row.jl")
include("results_folder_row.jl")
include("select_solver_row.jl")
include("print_plots_row.jl")
other_settings_row = html_div(
    className = "col",
    [
        html_div(
            className = "row m-1",
            [
                load_design_row,
            ]
        ),
        html_div(
            className = "row m-1",
            [
                results_folder_row,
            ]
        ),
        html_div(
            className = "row m-1",
            [
                print_plots_row,
            ]
        ),
        html_div(
            className = "row m-1",
            [
                select_solver_row,
            ]
        )
    ]
)
