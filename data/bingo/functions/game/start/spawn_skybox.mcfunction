#> bingo:game/start/spawn_skybox
#
# This function spawns the skybox after all chunks are generated
#
# @within
# 	function bingo:game/start/pre_gen/end
# 	function bingo:game/start/initialize_game_start
# @context position Spawn location

scoreboard players set $game_state bingo.state 2

kill @e[type=minecraft:area_effect_cloud, tag=bingo.skybox_cloud, limit=1]
bossbar set bingo:start/pre_gen/progress visible false
function neun_einser.timer:stop

fill ~-1 0 ~-1 ~1 130 ~1 minecraft:barrier replace #bingo:sky_box_chute_replaceables
fill ~ 0 ~ ~ 129 ~ minecraft:air replace minecraft:barrier
setblock ~ 127 ~ minecraft:barrier
execute if block ~ 62 ~ minecraft:water run setblock ~ 62 ~ minecraft:dirt
execute if block ~ 62 ~ minecraft:lava run setblock ~ 62 ~ minecraft:dirt

tellraw @a[tag=!bingo.resourcepack_check] "Loading terrain"
scoreboard players add $current_game_id bingo.game_id 1
scoreboard players operation @a[tag=!bingo.resourcepack_check] bingo.game_id = $current_game_id bingo.game_id
teleport @a[tag=!bingo.resourcepack_check] ~ 128 ~
#scoreboard players reset @a bingo.card_pos
scoreboard players reset @a bingo.pref
scoreboard players reset @a bingo.seed
scoreboard players reset @a bingo.settings

execute store result score $spawn_x bingo.state run data get entity @a[tag=!bingo.resourcepack_check, limit=1] Pos[0]
execute store result score $spawn_z bingo.state run data get entity @a[tag=!bingo.resourcepack_check, limit=1] Pos[2]

gamemode adventure @a[tag=!bingo.resourcepack_check]
effect give @a[tag=!bingo.resourcepack_check] minecraft:jump_boost 1000000 128 true
effect give @a[tag=!bingo.resourcepack_check] minecraft:invisibility 1000000 0 true
effect give @a[tag=!bingo.resourcepack_check] minecraft:saturation 1000000 255 true
effect give @a[tag=!bingo.resourcepack_check] minecraft:weakness 1000000 255 true
clear @a[tag=!bingo.resourcepack_check]
experience set @a[tag=!bingo.resourcepack_check] 0 levels
experience set @a[tag=!bingo.resourcepack_check] 0 points

execute in bingo:lobby positioned 0 0 0 run function bingo:game/start/init_teams

tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot0
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot1
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot2
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot3
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot4
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot5
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot6
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot7
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot8
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot9
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot10
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot11
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot12
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot13
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot14
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot15
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot16
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot17
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot18
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot19
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot20
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot21
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot22
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot23
tag @a[tag=!bingo.resourcepack_check] remove bingo.has_slot24

schedule function bingo:game/start/end_of_skybox 30s