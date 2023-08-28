#> fetchr:game/skybox/create_skybox/find_ground_level_in_row
#
# This function spawns the skybox after all chunks are generated
#
# @within function fetchr:game/skybox/create_skybox/internal
# @context
# 	entity Spawn marker
# 	position row start

#>
# @private
#declare score_holder $game/start/find_ground.current_y

execute positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~ ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~1 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~2 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~3 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~4 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~5 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~6 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~7 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~8 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~9 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~10 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~11 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~12 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~13 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~14 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp

execute positioned ~15 ~ ~ positioned over motion_blocking run teleport @s ~ ~ ~
execute store result score $game/start/find_ground.current_y fetchr.tmp run data get entity @s Pos[1]
scoreboard players operation $game/start/find_ground.y fetchr.tmp > $game/start/find_ground.current_y fetchr.tmp
#tellraw NeunEinser [{"text":"Current Y: "},{"score":{"name":"$game/start/find_ground.current_y","objective":"fetchr.tmp"}}, ", total y: ", {"score":{"name":"$game/start/find_ground.y","objective":"fetchr.tmp"}}]