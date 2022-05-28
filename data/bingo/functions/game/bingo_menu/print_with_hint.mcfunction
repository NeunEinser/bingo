#> bingo:game/bingo_menu/print_with_hint
#
# Display the bingo menu to @s and reset the trigger
#
# @internal
# @context
# 	entity The player to whom to display the bingo menu

function bingo:game/bingo_menu/print_without_hint
tellraw @s [{"translate": "bingo.game.menu.options.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.lobby", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.lobby"}}, {"text": "/trigger bingo.spectator", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.spectator"}}]}]

scoreboard players reset @s bingo.menu