#> fetchr:game/start/start_if_ready
#
# Check if the game is in a state it can be started in, and if it is, start it.
#
# @internal
# @user
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run return 0

execute unless score $pregen_status fetchr.state matches 2 run tellraw @s {"translate": "fetchr.skybox.start_game.error.not_ready", "color": "red"}
execute if score $pregen_status fetchr.state matches 2 at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run function fetchr:game/start/start_spawn_sequence