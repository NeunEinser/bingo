#> fetchr:lobby/settings/set_pre_gen_radius
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the pre-gen radius setting
#
# @user
# @context entity Player changing the setting

execute unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute unless score @s fetchr.operator matches 1 run return 0

scoreboard players enable @s fetchr.pre_gen_radius

tellraw @s ["\n\n\n\n\n=== ", {"translate": "fetchr.lobby.settings.pre_gen.menu.heading", "bold": true, "color": "green"}, " ===\n\n[", {"translate": "fetchr.lobby.settings.pre_gen.menu.option.minimal", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 144"}}, "]\n[", {"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius", "color": "#00c3ff", "with": ["1000"], "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 1000"}}, "]\n[", {"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius", "color": "#00c3ff", "with": ["2000"], "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 2000"}}, "]\n[", {"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius", "color": "#00c3ff", "with": ["5000"], "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 5000"}}, "]\n[", {"translate": "fetchr.lobby.settings.pre_gen.menu.option.radius", "color": "#00c3ff", "with": ["10000"], "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pre_gen_radius set 10000"}}, "]\n[", {"translate": "fetchr.lobby.settings.pre_gen.menu.option.custom", "color": "#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/trigger fetchr.pre_gen_radius set "}}, "]"]