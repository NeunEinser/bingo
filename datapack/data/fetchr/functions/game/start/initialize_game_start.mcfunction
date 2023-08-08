#> fetchr:game/start/initialize_game_start
#
# This function is called when a player starts the game and either starts pre-
# generating or spawns the skybox.
#
# @within function fetchr:game/start/check_and_start

kill @e[type=minecraft:marker, tag=fetchr.skybox_button, distance=..8]
kill @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=..8]
kill @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..8]

fill ~-8 ~-1 ~-8 ~9 ~5 ~9 minecraft:air
fill ~-1 62 ~-1 ~1 ~3 ~1 minecraft:barrier replace #fetchr:sky_box_chute_replaceables
fill ~ 62 ~ ~ ~2 ~ minecraft:air replace minecraft:barrier

setblock ~ ~-1 ~ minecraft:lime_stained_glass
teleport @a[predicate=fetchr:is_in_game] ~ ~ ~
tag @a remove fetchr.in_skybox

execute in fetchr:lobby run function fetchr:game/start/init_teams
execute if score $team_count fetchr.state matches 1 run scoreboard players set $lockout_mode fetchr.state 0

teleport @e[type=!#fetchr:keep_on_game_start, tag=!fetchr.generated_entity, distance=..10000] ~ -128 ~

# Minecraft sucks and creates item entities when replacing blocks because of order issues.
# @slicedlime fix your game
teleport @e[type=minecraft:item, distance=..9] ~ -128 ~
kill @e[y=-128, distance=..1]
schedule function fetchr:game/start/end_of_skybox 2s