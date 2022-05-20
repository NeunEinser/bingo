#> bingo:util/print_bingo_menu
#
# Display the bingo menu to @s
#
# @internal
# @context
# 	entity The player who wants to view the bingo menu

tellraw @s ["\n=== ", {"translate": "bingo.game.menu.title", "bold": true, "color": "green"}, " ===\n", {"translate": "bingo.game.menu.hint", "color": "gray", "italic": true, "with": [{"translate": "bingo.game.menu.text", "color": "white", "italic": false, "with": [{"translate": "bingo.game.menu.icon", "color": "#00c3ff", "italic": false, "clickEvent": {"action": "run_command", "value": "/trigger bingo.menu"}, "hoverEvent":{"action":"show_text","contents":[{"translate":"bingo.game.menu.hover_text"}]}}]}, {"text": "/trigger bingo.menu", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.menu"}}]}, "\n"]
tellraw @s [{"translate": "bingo.game.menu.options", "with": [{"translate": "bingo.game.menu.options.click_lobby", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, {"translate": "bingo.game.menu.options.click_spectator", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}]}]
tellraw @s [{"translate": "bingo.game.menu.options.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.lobby", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.lobby"}}, {"text": "/trigger bingo.spectator", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.spectator"}}]}]

scoreboard players reset @s bingo.menu