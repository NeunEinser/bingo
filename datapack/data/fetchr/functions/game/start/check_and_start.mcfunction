#> fetchr:game/start/check_and_start
#
# Check if the game is in a state it can be started in, and if it is, start it.
#
# @within function fetchr:lobby/settings/start_game_strict_mode_check

execute unless score $pregen_status fetchr.state matches 2 run tellraw @s {"translate": "fetchr.skybox.start_game.error.not_ready", "color": "red"}
execute if score $pregen_status fetchr.state matches 2 at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run function fetchr:game/start/initialize_game_start