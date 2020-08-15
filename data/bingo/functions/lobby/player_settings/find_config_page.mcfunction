scoreboard players set $j bingo_tmp 5
function bingo:lobby/player_settings/find_config_on_page

scoreboard players remove $i bingo_tmp 1
execute if score $i bingo_tmp matches 1.. run function bingo:lobby/player_settings/find_config_page