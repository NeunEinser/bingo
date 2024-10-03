#> fetchr:lobby/teleport_all
#
# Teleports all players to the lobby.
#
# @within function fetchr:lobby/player_tick

scoreboard players reset @s fetchr.teleport_all
scoreboard players enable @s fetchr.teleport_all
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run return 0

scoreboard players set @s fetchr.teleport_all 1
execute as @a[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby
scoreboard players reset * fetchr.game_id
scoreboard players set $current_game_id fetchr.game_id 0
scoreboard players reset @a fetchr.teleport_all