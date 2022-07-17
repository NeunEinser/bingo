tellraw @s ["\n===", {"translate": "fetchr.lobby.settings.player.load.title", "bold": true, "color": "green"}, "===\n", {"translate": "fetchr.lobby.settings.player.load.description"}, "\n"]

data modify storage fetchr:tmp playerConfigs set from storage fetchr:player configurations
scoreboard players operation $i fetchr.tmp = @s fetchr.menu_page
scoreboard players set $allow_fixed fetchr.tmp 1
execute if score $i fetchr.tmp matches 1.. run function fetchr:lobby/player_settings/find_config_page

scoreboard players set $i fetchr.tmp 0
function fetchr:lobby/player_settings/load/print_next_5

execute unless score @s fetchr.menu_page matches 1.. if data storage fetchr:tmp playerConfigs[0] run tellraw @s {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 20"}, "extra": ["[", {"translate": "fetchr.lobby.settings.player.next"}, " >]"]}
execute if score @s fetchr.menu_page matches 1.. if data storage fetchr:tmp playerConfigs[0] run tellraw @s ["", {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 19"}, "extra": ["[< ", {"translate": "fetchr.lobby.settings.player.prev"}, "]"]}, " ", [{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 20"}, "extra": ["[", {"translate": "fetchr.lobby.settings.player.next"}, " >]"]}]]
execute if score @s fetchr.menu_page matches 1.. unless data storage fetchr:tmp playerConfigs[0] run tellraw @s {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 19"}, "extra": ["[< ", {"translate": "fetchr.lobby.settings.player.prev"}, "]"]}