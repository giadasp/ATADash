function print_log(messages)
    p = ""
    if size(messages, 1) >= 1
        p = map(
            m -> html_div(
                className = string("card w-100"),
                children = [
                    html_div(
                        className = string(
                            "start_lbl_p card-body w-100 text-white bg-",
                            m[1],
                        ),
                        children = m[2],
                    ),
                ],
            ),
            messages,
        )
    else
        p = html_div(
            className = string("card w-100"),
            children = html_div(
                className = "start_lbl_p card-body w-100 text-white bg-danger",
                children = "Nothing to print.",
            ),
        )
    end
    return p
end
