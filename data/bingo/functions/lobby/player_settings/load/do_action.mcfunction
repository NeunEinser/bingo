execute if score @s bingo_settings matches 14..18 run function bingo:lobby/player_settings/load/load_config
execute if score @s bingo_settings matches 19 run function bingo:lobby/player_settings/load/print_prev_page
execute if score @s bingo_settings matches 20 run function bingo:lobby/player_settings/load/print_next_page