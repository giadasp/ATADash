include("load_design_row.jl")
include("results_folder_row.jl")
include("select_solver_row.jl")
#include("print_plots_row.jl")
other_settings_row = insert_row(insert_col([
    load_design_row,
    results_folder_row,
    #print_plots_row,
    select_solver_row,
],))
