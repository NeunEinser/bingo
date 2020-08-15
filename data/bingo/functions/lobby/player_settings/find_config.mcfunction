data modify storage bingo:tmp playerConfigs set from storage bingo:player configurations
execute if score $stash_prev bingo_tmp matches 1 run data modify storage bingo:player configurations set value []

scoreboard players operation $i bingo_tmp = @s bingo_menu_page
execute if score $i bingo_tmp matches 1.. run function bingo:lobby/player_settings/find_config_page

scoreboard players operation $j bingo_tmp = @s bingo_settings
scoreboard players operation $j bingo_tmp -= $first bingo_tmp
execute if score $j bingo_tmp matches 1.. run function bingo:lobby/player_settings/find_config_on_page
execute if score $stash_prev bingo_tmp matches 1 run function bingo:lobby/player_settings/find_config_on_page

scoreboard players reset $stash_prev bingo_tmp
scoreboard players reset $allow_fixed bingo_tmp