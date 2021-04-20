include("serialization.jl")
include("df_to_dict.jl")
include("dict_df_type_convert.jl")
include("print_log.jl")
include("parse_contents.jl")
include("insert_row.jl")
include("insert_card.jl")
include("read_input_settings_fields.jl")
include("create_input_settings_fields.jl")
include("start/start_tab.jl")
include("overlap/overlap_tab.jl")
include("bank/bank_tab.jl")
include("constraints/constraints_tab.jl")
include("log/log_tab.jl")
include("assemble/assemble_tab.jl")
include("results_tab.jl")

function ata_app()
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
        ),
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
                start_tab,
                bank_tab,
                overlap_tab,
                constraints_tab,
                log_tab,
                assemble_tab,
                results_tab,
                # ,
                # dcc_tab(label = "Assembled Tests", children = [
                # "hi3"
                # ]),
            ]),
            html_div(id = "enable_tabs", style = (display = "none"), children = ""),
        ],
    )

    # callback!(
    #     app,
    #     Input("start_btn", "n_clicks"),
    #     Input("start_lbl_p", "children"),
    #     State("spinner", "is_loading"),
    #     Output("spinner", "is_loading"),
    # ) do clicks, p, spinner
    #     if spinner 
    #         return false
    #     else
    #         return true
    #     end
    # end




    #UPLOAD Settings
    callback!(
        app,
        Output("upload_settings_lbl", "children"),
        Output("input_settings_fields", "children"),
        Input("upload_settings", "contents"),
        State("upload_settings", "filename"),
        State("upload_settings", "last_modified"),
    ) do content, name, date
        if isnothing(content)
            throw(PreventUpdate())
        else
            result, fields = parse_input_settings(content, name, date)
            return result, fields
        end
    end

    #UPLOAD  bank
    callback!(
        app,
        Output("upload_bank_lbl", "children"),
        Output("bank_table", "columns"),
        Output("bank_table", "data"),
        Input("upload_bank", "contents"),
        State("upload_bank", "filename"),
        State("upload_bank", "last_modified"),
    ) do content, name, date
        if isnothing(content)
            throw(PreventUpdate())
        else
            result, columns, data = parse_bank(content, name, date)
            return result, columns, data
        end
    end

    #UPLOAD overlap matrix
    callback!(
        app,
        Output("upload_overlap_lbl", "children"),
        Output("overlap_table", "columns"),
        Output("overlap_table", "data"),
        Input("upload_overlap", "contents"),
        Input("overlap_rows", "value"),
        State("upload_overlap", "filename"),
        State("upload_overlap", "last_modified"),
    ) do content, rows, name, date
        if isnothing(content) && rows == 0
            throw(PreventUpdate())
        else
            trigger = callback_context().triggered[1].prop_id
            if trigger == "upload_overlap.contents"
                result, columns, data = parse_overlap(content, name, date)
            elseif trigger == "overlap_rows.value"
                result = string("Overlap matrix has ", rows, " rows.")
                df = DataFrame(zeros(Float64, rows, rows))
                rename!(df, [string("t_", t) for t = 1:rows])
                dict = df_to_dict(df)
                columns = dict[1]
                data = dict[2]
            end
            return result, columns, data
        end
    end

    #ADD ROWS TO CONSTRAINTS TABLE
    callback!(
        app,
        Output("upload_constraints_lbl", "children"),
        Output("constraints_table", "columns"),
        Output("constraints_table", "data"),
        Input("upload_constraints", "contents"),
        Input("add_constraint_btn", "n_clicks"),
        State("upload_constraints", "filename"),
        State("upload_constraints", "last_modified"),
        State("constraints_table", "data"),
        State("constraints_table", "columns"),
    ) do content, add_row, name, date, data, columns
        if isnothing(content) && add_row == 0
            throw(PreventUpdate())
        else
            trigger = callback_context().triggered[1].prop_id
            if trigger == "upload_constraints.contents"
                result, columns, data = parse_bank(content, name, date)
            elseif trigger == "add_constraint_btn.n_clicks"
                result = string("New row added to constraints table.")
                push!(
                    data,
                    Dict(
                        "group" => "1",
                        "var" => "column_name",
                        "value" => "value",
                        "min" => "0.0",
                        "max" => "0.0",
                        "weight" => "1.0",
                    ),
                )
            end
            return result, columns, data
        end
    end

    callback!(
        app,
        Output("constraints_tab", "className"),
        Output("bank_tab", "className"),
        Output("overlap_tab", "className"),
        Output("assemble_tab", "className"),
        Output("results_tab", "className"),
        Output("model_log_tab", "className"),
        Input("enable_tabs", "children"),
    ) do children
        if children != "enabled"
            throw(PreventUpdate())
        else
            return "nav-link enabled",
            "nav-link enabled",
            "nav-link enabled",
            "nav-link enabled",
            "nav-link enabled",
            "nav-link enabled"
        end
    end

    #UPDATE MODEL
    callback!(
        app,
        Output("model_store", "data"),
        Input("model_store_start", "data"),
        Input("model_store_bank", "data"),
        Input("model_store_constraints", "data"),
        Input("model_store_overlap", "data"),
        Input("model_store_assemble", "data"),
    ) do model_start, model_bank, model_constraints, model_overlap, model_assemble
        if all(
            [model_start, model_bank, model_constraints, model_overlap, model_assemble] .==
            "",
        )
            throw(PreventUpdate())
        else
            trigger = callback_context().triggered[1].prop_id
            if trigger == "model_store_start.data"
                return model_start
            elseif trigger == "model_store_bank.data"
                return model_bank
            elseif trigger == "model_store_constraints.data"
                return model_constraints
            elseif trigger == "model_store_overlap.data"
                return model_overlap
            elseif trigger == "model_store_assemble.data"
                return model_assemble
            end
        end
    end

    #UPDATE LOG
    callback!(
        app,
        Output("model_log", "children"),
        Input("model_log_start", "children"),
        Input("model_log_bank", "children"),
        Input("model_log_constraints", "children"),
        Input("model_log_overlap", "children"),
        Input("model_log_assemble", "children"),
    ) do log_start, log_bank, log_constraints, log_overlap, log_assemble
        if all([log_start, log_bank, log_constraints, log_overlap, log_assemble] .== "")
            throw(PreventUpdate())
        else
            trigger = callback_context().triggered[1].prop_id
            if trigger == "model_log_start.children"
                return log_start
            elseif trigger == "model_log_bank.children"
                return log_bank
            elseif trigger == "model_log_constraints.children"
                return log_constraints
            elseif trigger == "model_log_overlap.children"
                return log_overlap
            elseif trigger == "model_log_assemble.children"
                return log_assemble
            end
        end
    end

    #INITIALIZE MODEL
    callback!(
        app,
        Output("enable_tabs", "children"),
        Output("model_store_start", "data"),
        Output("model_log_start", "children"),
        Input("start_btn", "n_clicks"),
        State("model_store", "data"),
        State("input_settings_fields", "children"),
    ) do start_btn, model_store, input_settings_fields
        if isnothing(start_btn) || start_btn == 0
            throw(PreventUpdate())
        else
            ata_model = deserialize_ata(model_store)
            i_s = read_input_settings_fields(input_settings_fields)
            ata_model = ATA.start_ata(; settings = i_s)
            return "enabled", serialize_ata(ata_model), print_log(ata_model.output.infos)
        end
    end

    #LOAD ITEM BANK
    callback!(
        app,
        Output("model_store_bank", "data"),
        Output("model_log_bank", "children"),
        Input("load_bank_btn", "n_clicks"),
        State("model_store", "data"),
        State("bank_table", "data"),
    ) do bank_btn, model_store, bank
        if isnothing(bank_btn) || bank_btn == 0
            throw(PreventUpdate())
        else
            ata_model = deserialize_ata(model_store)
            ATA.add_bank!(ata_model; bank = dict_to_df(bank))
            return serialize_ata(ata_model), print_log(ata_model.output.infos)
        end
    end

    #LOAD OVERLAP
    callback!(
        app,
        Output("model_store_overlap", "data"),
        Output("model_log_overlap", "children"),
        Input("load_overlap_btn", "n_clicks"),
        State("model_store", "data"),
        State("overlap_table", "data"),
    ) do overlap_btn, model_store, overlap
        if isnothing(overlap_btn) || overlap_btn == 0
            throw(PreventUpdate())
        else
            ata_model = deserialize_ata(model_store)
            ATA.add_overlap!(ata_model; overlap = dict_to_overlap_matrix(overlap))
            return serialize_ata(ata_model), print_log(ata_model.output.infos)
        end
    end

    #LOAD CONSTRAINTS
    callback!(
        app,
        Output("model_store_constraints", "data"),
        Output("model_log_constraints", "children"),
        Input("load_constraints_btn", "n_clicks"),
        State("model_store", "data"),
        State("constraints_table", "data"),
    ) do constraints_btn, model_store, constraints
        if isnothing(constraints_btn) || constraints_btn == 0
            throw(PreventUpdate())
        else
            ata_model = deserialize_ata(model_store)
            ATA.add_constraints!(ata_model; constraints = dict_to_df(constraints))
            return serialize_ata(ata_model), print_log(ata_model.output.infos)
        end
    end

    #ASSEMBLE
    callback!(
        app,
        Output("model_store_assemble", "data"),
        Output("model_log_assemble", "children"),
        Output("results_lbl", "children"),
        Input("assemble_btn", "n_clicks"),
        State("model_store", "data"),
        State("siman_parameters", "children"),
        State("jump_parameters", "children"),
        State("results_folder_txt", "value"),
        State("starting_design_txt", "value"),
        State("solver_txt", "value")
    ) do assemble_btn,
    model_store,
    siman_parameters,
    jump_parameters,
    results_folder,
    starting_design,
    solver
        if isnothing(assemble_btn) || assemble_btn == 0
            throw(PreventUpdate())
        else
            ata_model = deserialize_ata(model_store)
            ATA.add_obj_fun!(ata_model)
            if isfile(starting_design)
                starting_design =
                    Matrix{Float64}(CSV.read(starting_design, delim = ";", header = false))
            else
                starting_design = Matrix{Float64}(undef, 0, 0)
            end
            if solver == "siman"
                inputs = parse_parameters_siman(siman_parameters)
                ATA.assemble!(
                    ata_model;
                    solver = "siman",
                    start_temp = Float64(inputs["start_temp"]),
                    geom_temp = Float64(inputs["geom_temp"]),
                    max_time = Float64(inputs["max_time"]),
                    results_folder = String(results_folder),
                    n_item_sample = Int64(inputs["n_item_sample"]),
                    n_test_sample = Int64(inputs["n_test_sample"]),
                    max_conv = Int64(inputs["max_conv"]),
                    verbosity = Int64(inputs["verbosity"]),
                    opt_feas = Float64(inputs["opt_feas"]),
                    n_fill = Int64(inputs["n_fill"]),
                    feas_nh = Int64(inputs["feas_nh"]),
                    opt_nh = Int64(inputs["opt_nh"]),
                )
            else
                ATA.assemble!(
                    ata_model;
                    solver = "jump",
                    optimizer_attributes = eval(Meta.parse(inputs["optimizer_attributes"])),
                    optimizer_constructor = String(inputs["optimizer_constructor"]), #eval(Meta.parse(string(optimizer_constructor,".Optimizer")))
                )
            end
            ATA.print_results(ata_model, results_folder = results_folder)
            output = read(string(results_folder, "/results.txt"), String)
            return serialize_ata(ata_model), print_log(ata_model.output.infos), output
        end
    end

    println("Started at localhost:8080")
    run_server(app, "0.0.0.0", 8080)
end
