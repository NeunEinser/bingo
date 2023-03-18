execute if score $allow_fixed fetchr.tmp matches 0 if data storage fetchr:tmp playerConfigs[0].fixed run function fetchr:lobby/player_settings/find_not_fixed
execute if score $stash_prev fetchr.tmp matches 1 run data modify storage fetchr:player configurations append from storage fetchr:tmp playerConfigs[0]
data remove storage fetchr:tmp playerConfigs[0]

scoreboard players remove $j fetchr.tmp 1
execute if score $j fetchr.tmp matches 1.. run function fetchr:lobby/player_settings/find_config_on_page