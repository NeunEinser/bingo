data modify storage bingo:tmp playerConfigs set from storage bingo:player configurations
execute if score $stash_prev bingo.tmp matches 1 run data modify storage bingo:player configurations set value []

scoreboard players operation $i bingo.tmp = @s bingo.menu_page
execute if score $i bingo.tmp matches 1.. run function bingo:lobby/player_settings/find_config_page

scoreboard players operation $j bingo.tmp = @s bingo.settings
scoreboard players operation $j bingo.tmp -= $first bingo.tmp
execute if score $j bingo.tmp matches 1.. run function bingo:lobby/player_settings/find_config_on_page
execute if score $stash_prev bingo.tmp matches 1 run function bingo:lobby/player_settings/find_config_on_page

scoreboard players reset $stash_prev bingo.tmp
scoreboard players reset $allow_fixed bingo.tmp