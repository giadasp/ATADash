include("create_model/create_model_tab.jl")
include("assemble/assemble_tab.jl")
include("results_tab.jl")

function ATA_app()
    js_files = [
        Dict(
            "src" => "https://code.jquery.com/jquery-3.5.1.slim.min.js",
            "integrity" =>
                "sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj",
            "crossorigin" => "anonymous",
        ),
        Dict(
            "src" =>
                "https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js",
            "integrity" =>
                "sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI",
            "crossorigin" => "anonymous",
        ),
    ]
    css_files = [
        Dict(
            "href" =>
                "https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css",
            "integrity" =>
                "sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk",
            "crossorigin" => "anonymous",
            "rel" => "stylesheet",
        )
    ]
    ata_model = ATA.NoObjModel()
    app = dash(
        external_scripts = js_files,
        external_stylesheets = css_files,
        assets_folder = "src/assets",
    )
    app.layout = dcc_loading(
        id = "spinner",
        type = "default",
        fullscreen = true,
        children = [
            dcc_tabs([
                create_model_tab,
                assemble_tab,
                results_tab,
                # ,
                # DashCoreComponents.dcc_tab(label = "Assembled Tests", children = [
                # "hi3"
                # ]),
        ])
        ]
    )
    # callback!(
    #     app,
    #     Input("create_model_btn", "n_clicks"),
    #     Input("create_model_lbl_p", "children"),
    #     State("spinner", "is_loading"),
    #     Output("spinner", "is_loading"),
    # ) do clicks, p, spinner
    #     if spinner 
    #         return false
    #     else
    #         return true
    #     end
    # end

    callback!(
        app,
        Output("assemble_tab", "className"),
        Output("results_tab", "className"),
        Output("create_model_lbl", "children"),
        Output("wd_div", "children"),
        Input("create_model_btn", "n_clicks"),
        State("folder_txt", "value"),
        State("settings_file_txt", "value"),
        State("bank_txt", "value"),
        State("bank_delim_txt", "value"),
        State("constraints_file_txt", "value"),
        State("constraints_file_delim_txt", "value"),
        State("overlap_file_txt", "value"),
        State("overlap_file_delim_txt", "value"),
        State("add_flags_txt", "value")
    ) do clicks, folder, settings_file, bank_file, bank_delim, constraints_file, constraints_delim, overlap_file, overlap_delim, flags
        if isnothing(clicks) || clicks == 0
            throw(PreventUpdate())
        else
            folder = replace(folder, "\\" => "/")
            cd(folder)
            add_friend_sets = "add_friend_sets" in flags
            add_enemy_sets = "add_enemy_sets" in flags
            add_constraints = "add_constraints" in flags
            add_exp_score = "add_exp_score" in flags
            add_overlap = "add_overlap" in flags
            group_by_friends = "group_by_friends" in flags
            add_obj_fun = "add_obj_fun" in flags
            messages = ["danger", ""]
            try
                ata_model = ATA.start_ATA(;
                    settings_file = settings_file,
                    bank_file = bank_file,
                    bank_delim = bank_delim,
                )
                if add_friend_sets
                    ATA.add_friends!(ata_model)
                end
                if add_enemy_sets
                    ATA.add_enemies!(ata_model)
                end
                if add_constraints
                    ATA.add_constraints!(
                        ata_model;
                        constraints_file = constraints_file,
                        constraints_delim = constraints_delim,
                    )
                end
                if add_overlap
                    ATA.add_overlap!(
                        ata_model;
                        overlap_file = overlap_file,
                        overlap_delim = overlap_delim,
                    )
                end
                if add_exp_score
                    ATA.add_exp_score!(ata_model)
                end
                if group_by_friends
                    ATA.group_by_friends!(ata_model)
                end
                if add_obj_fun
                    ATA.add_obj_fun!(ata_model)
                end
                messages = ata_model.output.infos
            catch e
                messages[2] = sprint(showerror, e)
            end
            if size(messages, 1) > 1
                p = map(m -> 
                    html_div(
                        className = string("card w-100"),
                        children = [
                            html_div(
                            className = string("create_model_lbl_p card-body w-100 text-white bg-", m[1]),
                            children = m[2]
                            )
                        ]
                    ),
                messages
                )
            elseif size(messages, 1) == 1
                p =  html_div(
                    className = string("card w-100"),
                    children = html_div(
                        className = string("create_model_lbl_p card-body w-100 text-white bg-", messages[1]),
                        children = m[2]
                    )
                )
            else
                p = html_div(
                    className = string("card w-100"),
                    children = html_div(
                        className = "create_model_lbl_p card-body w-100 text-white bg-danger",
                        children = "Nothing to print"
                    )
                )
            end
            JLD2.@save "ata_model.jld2" ata_model
            return  "nav-link enabled", "nav-link enabled", p, folder
        end
    end

    callback!(
    app,
        [Output("results_lbl", "children"), Output("results_card", "className")],
        Input("assemble_btn", "n_clicks"),
        [
            State("start_temp_txt", "value"),
            State("geom_temp_txt", "value"),
            State("max_time_txt", "value"),
            State("n_item_sample_txt", "value"),
            State("n_test_sample_txt", "value"),
            State("max_conv_txt", "value"),
            State("verbosity_txt", "value"),
            State("opt_feas_txt", "value"),
            State("n_fill_txt", "value"),
            State("feas_nh_txt", "value"),
            State("opt_nh_txt", "value"),
            State("optimizer_constructor_txt", "value"),
            State("optimizer_attributes_txt", "value"),
            State("starting_design_txt", "value"),
            State("solver_txt", "value"),
            State("plots_out_txt", "value"),
            State("results_folder_txt", "value"),
            State("wd_div", "children"),
        ],
    ) do n_clicks,
    start_temp,
    geom_temp,
    max_time,
    n_item_sample,
    n_test_sample,
    max_conv,
    verbosity,
    opt_feas,
    n_fill,
    feas_nh,
    opt_nh,
    optimizer_constructor,
    optimizer_attributes,
    starting_design,
    solver,
    plots_out,
    results_folder,
    folder
        if n_clicks > 0
            output = ""
            try
                cd(folder)
                results_folder = "RESULTS"
                if isfile(starting_design)
                    starting_design = Matrix{Float64}(
                        CSV.read(starting_design, delim = ";", header = false),
                    )
                else
                    starting_design = Matrix{Float64}(undef, 0, 0)
                end
                println(
                    " ",
                    solver,
                    " ",
                    start_temp,
                    " ",
                    geom_temp,
                    " ",
                    max_time,
                    " ",
                    results_folder,
                    " ",
                    n_item_sample,
                    " ",
                    n_test_sample,
                    " ",
                    max_conv,
                    " ",
                    verbosity,
                    " ",
                    opt_feas,
                    " ",
                    n_fill,
                    " ",
                    feas_nh,
                    " ",
                    opt_nh,
                    " ",
                    optimizer_constructor
                )
                println("assemble")
                ATA.assemble!(
                    ata_model;
                    solver = String(solver),
                    starting_design = starting_design,
                    start_temp = Float64(start_temp),
                    geom_temp = Float64(geom_temp),
                    max_time = Float64(max_time),
                    results_folder = String(results_folder),
                    n_item_sample = Int64(n_item_sample),
                    n_test_sample = Int64(n_test_sample),
                    max_conv = Int64(max_conv),
                    verbosity = Int64(verbosity),
                    opt_feas = Float64(opt_feas),
                    n_fill = Int64(n_fill),
                    feas_nh = Int64(feas_nh),
                    opt_nh = Int64(opt_nh),
                    optimizer_attributes = eval(Meta.parse(optimizer_attributes)),
                    optimizer_constructor = String(optimizer_constructor), #eval(Meta.parse(string(optimizer_constructor,".Optimizer")))
                )
                plots_out = (plots_out == "yes") ? true : false
                if ata_model.settings.n_fs != ata_model.settings.n_items
                    ATA.print_results(
                        ata_model,
                        group_by_fs = true,
                        results_folder = results_folder,
                    )
                else
                    ATA.print_results(ata_model, results_folder = results_folder)
                end
                output = read(string(results_folder, "/Results.txt"), String)
            catch e
                output = sprint(showerror, e)
            end
            return output, "card h-100 bg-light"
        else
            return "", "card h-100 bg-light"
        end
    end

    println("Started at localhost:8080")
    run_server(app, "0.0.0.0", 8080)
end
