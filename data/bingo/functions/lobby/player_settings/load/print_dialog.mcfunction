tellraw @s ["\n===", {"translate": "bingo.lobby.settings.player.load.title", "bold": true, "color": "green"}, "===\n", {"translate": "bingo.lobby.settings.player.load.description"}, "\n"]

data modify storage bingo:tmp playerConfigs set from storage bingo:player configurations
scoreboard players operation $i bingo_tmp = @s bingo_menu_page
scoreboard players set $allow_fixed bingo_tmp 1
execute if score $i bingo_tmp matches 1.. run function bingo:lobby/player_settings/find_config_page

scoreboard players set $i bingo_tmp 0
function bingo:lobby/player_settings/load/print_next_5

execute unless score @s bingo_menu_page matches 1.. if data storage bingo:tmp playerConfigs[0] run tellraw @s {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger bingo_settings set 20"}, "extra": ["[", {"translate": "bingo.lobby.settings.player.next"}, " >]"]}
execute if score @s bingo_menu_page matches 1.. if data storage bingo:tmp playerConfigs[0] run tellraw @s ["", {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger bingo_settings set 19"}, "extra": ["[< ", {"translate": "bingo.lobby.settings.player.prev"}, "]"]}, " ", [{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger bingo_settings set 20"}, "extra": ["[", {"translate": "bingo.lobby.settings.player.next"}, " >]"]}]]
execute if score @s bingo_menu_page matches 1.. unless data storage bingo:tmp playerConfigs[0] run tellraw @s {"text": "", "clickEvent": {"action": "run_command", "value": "/trigger bingo_settings set 19"}, "extra": ["[< ", {"translate": "bingo.lobby.settings.player.prev"}, "]"]}