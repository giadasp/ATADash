# print_plots_row = html_div(
#     className = "row m-1",
#     [
#         insert_col( children =  [html_label("Print plots:")]),
#         html_div(
#             className = "col",
#             [
#                 dcc_dropdown(
#                     value = "no",
#                     id = "plots_out_txt",
#                     options = [
#                         (label = "yes", value = "yes"),
#                         (label = "no", value = "no"),
#                     ],
#                 ),
#             ],
#         ),
#     ],
# )
