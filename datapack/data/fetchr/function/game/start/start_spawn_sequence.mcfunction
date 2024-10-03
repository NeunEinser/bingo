#> fetchr:game/start/start_spawn_sequence
#
# This function is called when a player starts the game and either starts pre-
# generating or spawns the skybox.
#
# @within function fetchr:game/start/start_if_ready

kill @e[type=minecraft:marker, tag=fetchr.skybox_button, distance=..8]
kill @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=..8]
kill @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..8]

fill ~-8 ~-1 ~-8 ~9 ~5 ~9 minecraft:air
fill ~-1 62 ~-1 ~1 ~3 ~1 minecraft:barrier replace #fetchr:sky_box_chute_replaceables
fill ~ 62 ~ ~ ~2 ~ minecraft:air replace minecraft:barrier

execute as @a[predicate=fetchr:is_in_game] unless score @s fetchr.game_id = $current_game_id fetchr.game_id run function fetchr:util/go_to_lobby

setblock ~ ~-1 ~ minecraft:lime_stained_glass
teleport @a[predicate=fetchr:is_in_game] ~ ~ ~
tag @a remove fetchr.in_skybox
effect give @a[predicate=fetchr:is_in_game] minecraft:invisibility infinite 1 true
execute as @a run attribute @s generic.gravity base set 0.08

execute in fetchr:lobby run function fetchr:game/start/init_teams
execute if score $team_count fetchr.state matches 1 run scoreboard players set $lockout_mode fetchr.state 0

teleport @e[type=!#fetchr:keep_on_game_start, tag=!fetchr.generated_entity, distance=..10000] ~ -128 ~

teleport @e[type=minecraft:item, distance=..9] ~ -128 ~
kill @e[y=-128, distance=..1]

execute if score $allow_spectating fetchr.settings matches 1 in fetchr:lobby as @e[type=minecraft:marker, tag=fetchr.join_game_sign, distance=0..] run data modify entity @s data.front_text.messages set value ['{"translate":"fetchr.lobby.card_generation.join_as_spectator.sign.line1","bold":true,"color":"#8eedeb","clickEvent":{"action":"run_command","value":"/function fetchr:lobby/settings/join_game"}}','{"translate":"fetchr.lobby.card_generation.join_as_spectator.sign.line2","bold":true,"color":"#8eedeb"}','{"translate":"fetchr.lobby.card_generation.join_as_spectator.sign.line3","bold":true,"color":"#8eedeb"}','{"translate":"fetchr.lobby.card_generation.join_as_spectator.sign.line4","bold":true,"color":"#8eedeb"}']

schedule clear fetchr:game/start/pre_gen/schedule_entity_check
schedule function fetchr:game/start/start_falling 2s
