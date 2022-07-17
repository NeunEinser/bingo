tellraw @s ["\n===", {"translate": "fetchr.lobby.settings.player.save.title", "bold": true, "color": "green"}, "===\n", {"translate": "fetchr.lobby.settings.player.save.description"}, "\n"]

data modify storage fetchr:tmp playerConfigs set from storage fetchr:player configurations
scoreboard players operation $i fetchr.tmp = @s fetchr.menu_page
execute if score $i fetchr.tmp matches 1.. run function fetchr:lobby/player_settings/find_config_page
scoreboard players set $i fetchr.tmp 0
function fetchr:lobby/player_settings/save/print_next_5

tellraw @s ["[", {"translate": "fetchr.lobby.settings.player.save.new", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 10"}}, "]"]

execute unless score @s fetchr.menu_page matches 1.. if data storage fetchr:tmp playerConfigs[0] run tellraw @s {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 12"}, "extra": ["[", {"translate": "fetchr.lobby.settings.player.next"}, " >]"]}
execute if score @s fetchr.menu_page matches 1.. if data storage fetchr:tmp playerConfigs[0] run tellraw @s ["", {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 11"}, "extra": ["[< ", {"translate": "fetchr.lobby.settings.player.prev"}, "]"]}, " ", [{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 12"}, "extra": ["[", {"translate": "fetchr.lobby.settings.player.next"}, " >]"]}]]
execute if score @s fetchr.menu_page matches 1.. unless data storage fetchr:tmp playerConfigs[0] run tellraw @s {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 11"}, "extra": ["[< ", {"translate": "fetchr.lobby.settings.player.prev"}, "]"]}