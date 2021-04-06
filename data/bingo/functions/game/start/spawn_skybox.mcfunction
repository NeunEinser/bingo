#> bingo:game/start/spawn_skybox
#
# This function spawns the skybox after all chunks are generated
#
# @within function bingo:game/start/pre_generate_next_chunk

fill ~-1 0 ~-1 ~1 129 ~1 minecraft:barrier replace #bingo:sky_box_chute_replaceables
fill ~ 0 ~ ~ 129 ~ minecraft:air replace minecraft:barrier
setblock ~ 127 ~ minecraft:barrier
execute if block ~ 62 ~ minecraft:water run setblock ~ 62 ~ minecraft:dirt
execute if block ~ 62 ~ minecraft:lava run setblock ~ 62 ~ minecraft:dirt

tellraw @a "Loading terrain"
teleport @a ~ 128 ~
gamemode adventure @a
effect give @a minecraft:jump_boost 1000000 128 true
effect give @a minecraft:invisibility 1000000 0 true
effect give @a minecraft:saturation 1000000 255 true
clear @a

team modify bingo.aqua seeFriendlyInvisibles false
team modify bingo.black seeFriendlyInvisibles false
team modify bingo.blue seeFriendlyInvisibles false
team modify bingo.dark_aqua seeFriendlyInvisibles false
team modify bingo.dark_blue seeFriendlyInvisibles false
team modify bingo.dark_gray seeFriendlyInvisibles false
team modify bingo.dark_green seeFriendlyInvisibles false
team modify bingo.dark_purpl seeFriendlyInvisibles false
team modify bingo.dark_red seeFriendlyInvisibles false
team modify bingo.gold seeFriendlyInvisibles false
team modify bingo.gray seeFriendlyInvisibles false
team modify bingo.green seeFriendlyInvisibles false
team modify bingo.light_purp seeFriendlyInvisibles false
team modify bingo.red seeFriendlyInvisibles false
team modify bingo.white seeFriendlyInvisibles false
team modify bingo.yellow seeFriendlyInvisibles false

schedule function bingo:game/start/end_of_skybox 30s