#> bingo:game/bingo_menu/print_without_hint
#
# Display the bingo menu options to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options

tellraw @s {"translate": "%1074992263$s%1$s", "with": [["", {"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, " to go back to the lobby.\n", {"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}, " to switch to spectator mode."], [{"translate": "bingo.game.menu.options", "with": [{"translate": "bingo.game.menu.options.click_lobby", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, {"translate": "bingo.game.menu.options.click_spectator", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}]}]]}
