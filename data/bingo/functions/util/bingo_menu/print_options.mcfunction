#> bingo:util/bingo_menu/print_options
#
# Display the bingo menu options to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options

tellraw @s [{"translate": "bingo.game.menu.options", "with": [{"translate": "bingo.game.menu.options.click_lobby", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, {"translate": "bingo.game.menu.options.click_spectator", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}]}]
