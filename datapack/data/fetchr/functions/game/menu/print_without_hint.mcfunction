#> fetchr:game/menu/print_without_hint
#
# Display the menu options to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options

tellraw @s ["===", {"translate": "fetchr.game.menu.heading", "bold": true, "color": "green"}, "==="]
tellraw @s ["[", {"translate": "fetchr.game.menu.options.goto_lobby", "fallback": "Go to lobby", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.lobby"}}, "]"]
execute if score $allow_spectating fetchr.settings matches 1 run tellraw @s ["[", {"translate": "fetchr.game.menu.options.enter_spectator_mode", "fallback": "Enter spectator mode", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.spectator"}}, "]"]
execute if score $blind_mode fetchr.state matches 1 run tellraw @s ["[", {"translate": "fetchr.game.menu.options.reveal_card", "fallback": "Reveal the bingo card", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.reveal_card"}}, "]"]