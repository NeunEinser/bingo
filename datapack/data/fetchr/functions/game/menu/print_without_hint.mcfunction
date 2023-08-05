#> fetchr:game/menu/print_without_hint
#
# Display the menu options to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options

tellraw @s {"translate": "fetchr.game.menu.options", "fallback": "%s to go back to the lobby.\n%s to switch to spectator mode.", "with": [{"translate": "fetchr.game.menu.options.click_lobby", "fallback": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.lobby"}}, {"translate": "fetchr.game.menu.options.click_spectator", "fallback": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.spectator"}}]}
execute if score $blind_mode fetchr.state matches 1 run tellraw @s {"translate": "fetchr.game.menu.options.reveal_card", "fallback": "%s to reveal the Bingo Card", "with": [{"translate": "fetchr.game.menu.options.click_reveal", "fallback": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.reveal_card"}}]}
