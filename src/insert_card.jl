function insert_card(body; card_id = "", kwargs...)
    card = html_div(
        id = card_id,
        className = "card h-100",
        children = html_div(className = "card-body", children = insert_row(body)),
        kwargs...,
    )
    return card
end
