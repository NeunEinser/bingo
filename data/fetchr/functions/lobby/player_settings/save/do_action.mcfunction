execute if score @s fetchr.settings matches 5..9 run function fetchr:lobby/player_settings/save/overwrite_save
execute if score @s fetchr.settings matches 10 run function fetchr:lobby/player_settings/save/print_new_config_dialog
execute if score @s fetchr.settings matches 11 run function fetchr:lobby/player_settings/save/print_prev_page
execute if score @s fetchr.settings matches 12 run function fetchr:lobby/player_settings/save/print_next_page