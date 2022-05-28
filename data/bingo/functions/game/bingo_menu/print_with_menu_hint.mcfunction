#> bingo:game/bingo_menu/print_with_menu_hint
#
# Display the bingo menu hint to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu hint

function bingo:game/bingo_menu/print_without_hint
tellraw @s {"translate": "%1074992263$s%1$s", "with": [["", {"text": "Hint: You can click ", "color": "gray", "italic": true}, {"translate":"[%s]", "color":"white", "italic":false, "with":[{"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger bingo.menu"}, "hoverEvent":{"action":"show_text", "contents":[{"translate":"bingo.game.menu.hover_text"}]}}]}, {"text": " or use the command ", "color": "gray", "italic": true}, {"text": "/trigger bingo.menu", "color": "white", "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.menu"}}, {"text":" at any time to bring up the bingo menu.", "color":"gray", "italic":true}], [{"translate": "bingo.game.menu.hint", "color": "gray", "italic": true, "with": [{"translate":"[%s]", "color":"white", "italic":false, "with":[{"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger bingo.menu"}, "hoverEvent":{"action":"show_text", "contents":[{"translate":"bingo.game.menu.hover_text"}]}}]}, {"text":"/trigger bingo.menu", "color":"white", "italic":false, "clickEvent":{"action":"suggest_command", "value":"/trigger bingo.menu"}}]}]]}
