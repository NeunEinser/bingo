#> bingo:game/start/spawn_skybox
#
# This function spawns the skybox after all chunks are generated
#
# @within
# 	function bingo:game/start/pre_gen/end
# 	function bingo:game/start/initialize_game_start
# @context position Spawn location

kill @e[type=minecraft:area_effect_cloud, tag=bingo.skybox_cloud, limit=1]
bossbar set bingo:start/pre_gen/progress visible false
function neun_einser.timer:stop

fill ~-1 0 ~-1 ~1 130 ~1 minecraft:barrier replace #bingo:sky_box_chute_replaceables
fill ~ 0 ~ ~ 129 ~ minecraft:air replace minecraft:barrier
setblock ~ 127 ~ minecraft:barrier
execute if block ~ 62 ~ minecraft:water run setblock ~ 62 ~ minecraft:dirt
execute if block ~ 62 ~ minecraft:lava run setblock ~ 62 ~ minecraft:dirt

tellraw @a "Loading terrain"
teleport @a ~ 128 ~

execute store result score $spawn_x bingo.state run data get entity @a[limit=1] Pos[0]
execute store result score $spawn_z bingo.state run data get entity @a[limit=1] Pos[2]

gamemode adventure @a
effect give @a minecraft:jump_boost 1000000 128 true
effect give @a minecraft:invisibility 1000000 0 true
effect give @a minecraft:saturation 1000000 255 true
clear @a
experience set @s 0 levels
experience set @s 0 points

execute in bingo:lobby positioned 0 0 0 run function bingo:game/start/init_teams

tag @a remove bingo.has_slot0
tag @a remove bingo.has_slot1
tag @a remove bingo.has_slot2
tag @a remove bingo.has_slot3
tag @a remove bingo.has_slot4
tag @a remove bingo.has_slot5
tag @a remove bingo.has_slot6
tag @a remove bingo.has_slot7
tag @a remove bingo.has_slot8
tag @a remove bingo.has_slot9
tag @a remove bingo.has_slot10
tag @a remove bingo.has_slot11
tag @a remove bingo.has_slot12
tag @a remove bingo.has_slot13
tag @a remove bingo.has_slot14
tag @a remove bingo.has_slot15
tag @a remove bingo.has_slot16
tag @a remove bingo.has_slot17
tag @a remove bingo.has_slot18
tag @a remove bingo.has_slot19
tag @a remove bingo.has_slot20
tag @a remove bingo.has_slot21
tag @a remove bingo.has_slot22
tag @a remove bingo.has_slot23
tag @a remove bingo.has_slot24

schedule function bingo:game/start/end_of_skybox 30s