#> fetchr:game/menu/print_without_hint
#
# Display the menu options to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options

tellraw @s {"translate": "%1162888552$s%1$s", "with": [["", {"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.lobby"}}, " to go back to the lobby.\n", {"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.spectator"}}, " to switch to spectator mode."], [{"translate": "fetchr.game.menu.options", "with": [{"translate": "fetchr.game.menu.options.click_lobby", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.lobby"}}, {"translate": "fetchr.game.menu.options.click_spectator", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.spectator"}}]}]]}
