#> fetchr:game/start/teleport_all
#
# Teleport all players to the skybox
#
# @internal
# @user

execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run return 0

execute as @a[predicate=fetchr:is_in_lobby] at @e[type=minecraft:marker, tag=fetchr.spawn] run function fetchr:game/skybox/join_game