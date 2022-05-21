#> bingo:util/bingo_menu/print_options_hint
#
# Display the bingo menu options hint to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options hint

tellraw @s [{"translate": "bingo.game.menu.options.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.lobby", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.lobby"}}, {"text": "/trigger bingo.spectator", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.spectator"}}]}]
