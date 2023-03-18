scoreboard players set $j fetchr.tmp 5
function fetchr:lobby/player_settings/find_config_on_page

scoreboard players remove $i fetchr.tmp 1
execute if score $i fetchr.tmp matches 1.. run function fetchr:lobby/player_settings/find_config_page