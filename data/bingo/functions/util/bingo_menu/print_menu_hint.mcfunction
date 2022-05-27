#> bingo:util/bingo_menu/print_menu_hint
#
# Display the bingo menu hint to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu hint

tellraw @s [{"translate": "bingo.game.menu.hint", "color": "gray", "italic": true, "with": [{"translate":"[%s]", "color":"white", "italic":false, "with":[{"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger bingo.menu"}, "hoverEvent":{"action":"show_text", "contents":[{"translate":"bingo.game.menu.hover_text"}]}}]}, {"text":"/trigger bingo.menu", "color":"white", "italic":false, "clickEvent": {"action":"suggest_command", "value":"/trigger bingo.menu"}}]}]
