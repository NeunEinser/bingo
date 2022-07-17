data modify storage fetchr:tmp playerConfigs set from storage fetchr:player configurations
execute if score $stash_prev fetchr.tmp matches 1 run data modify storage fetchr:player configurations set value []

scoreboard players operation $i fetchr.tmp = @s fetchr.menu_page
execute if score $i fetchr.tmp matches 1.. run function fetchr:lobby/player_settings/find_config_page

scoreboard players operation $j fetchr.tmp = @s fetchr.settings
scoreboard players operation $j fetchr.tmp -= $first fetchr.tmp
execute if score $j fetchr.tmp matches 1.. run function fetchr:lobby/player_settings/find_config_on_page
execute if score $stash_prev fetchr.tmp matches 1 run function fetchr:lobby/player_settings/find_config_on_page

scoreboard players reset $stash_prev fetchr.tmp
scoreboard players reset $allow_fixed fetchr.tmp