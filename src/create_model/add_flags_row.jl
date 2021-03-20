dropdown_options = [
    Dict("label" => "Add constraints", "value" => "add_constraints"),
    Dict("label" => "Add friend sets", "value" => "add_friend_sets"),
    Dict("label" => "Add enemies", "value" => "add_enemy_sets"),
    Dict("label" => "Add overlap", "value" => "add_overlap"),
    Dict("label" => "Add expected score constraints", "value" => "add_exp_score"),
    Dict("label" => "Group by friend sets", "value" => "group_by_friends"),
    Dict("label" => "Add objective function", "value" => "add_obj_fun"),
]

add_flags_row = html_div(
    className = "row m-1",
    [
        html_div(
            className = "col",
            [
                html_div(
                    className = "row m-1",
                    [
                        dcc_checklist(
                            id = "add_flags_txt",
                            options = dropdown_options,
                            value = [
                                "add_constraints",
                                "add_overlap",
                                "add_friend_sets",
                                "add_enemy_sets",
                                "add_exp_score",
                                "group_by_friends",
                                "add_obj_fun",
                            ],
                        ),
                    ],
                ),
            ],
        ),
    ],
)
