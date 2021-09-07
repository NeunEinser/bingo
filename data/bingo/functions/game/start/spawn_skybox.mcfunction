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



#>
# This tag marks a player who is in a team that obtained the item in slot 0.
#
# @private
#declare tag bingo.has_slot0
#>
# This tag marks a player who is in a team that obtained the item in slot 1.
#
# @private
#declare tag bingo.has_slot1
#>
# This tag marks a player who is in a team that obtained the item in slot 2.
#
# @private
#declare tag bingo.has_slot2
#>
# This tag marks a player who is in a team that obtained the item in slot 3.
#
# @private
#declare tag bingo.has_slot3
#>
# This tag marks a player who is in a team that obtained the item in slot 4.
#
# @private
#declare tag bingo.has_slot4
#>
# This tag marks a player who is in a team that obtained the item in slot 5.
#
# @private
#declare tag bingo.has_slot5
#>
# This tag marks a player who is in a team that obtained the item in slot 6.
#
# @private
#declare tag bingo.has_slot6
#>
# This tag marks a player who is in a team that obtained the item in slot 7.
#
# @private
#declare tag bingo.has_slot7
#>
# This tag marks a player who is in a team that obtained the item in slot 8.
#
# @private
#declare tag bingo.has_slot8
#>
# This tag marks a player who is in a team that obtained the item in slot 9.
#
# @private
#declare tag bingo.has_slot9
#>
# This tag marks a player who is in a team that obtained the item in slot 10.
#
# @private
#declare tag bingo.has_slot10
#>
# This tag marks a player who is in a team that obtained the item in slot 11.
#
# @private
#declare tag bingo.has_slot11
#>
# This tag marks a player who is in a team that obtained the item in slot 12.
#
# @private
#declare tag bingo.has_slot12
#>
# This tag marks a player who is in a team that obtained the item in slot 13.
#
# @private
#declare tag bingo.has_slot13
#>
# This tag marks a player who is in a team that obtained the item in slot 14.
#
# @private
#declare tag bingo.has_slot14
#>
# This tag marks a player who is in a team that obtained the item in slot 15.
#
# @private
#declare tag bingo.has_slot15
#>
# This tag marks a player who is in a team that obtained the item in slot 16.
#
# @private
#declare tag bingo.has_slot16
#>
# This tag marks a player who is in a team that obtained the item in slot 17.
#
# @private
#declare tag bingo.has_slot17
#>
# This tag marks a player who is in a team that obtained the item in slot 18.
#
# @private
#declare tag bingo.has_slot18
#>
# This tag marks a player who is in a team that obtained the item in slot 19.
#
# @private
#declare tag bingo.has_slot19
#>
# This tag marks a player who is in a team that obtained the item in slot 20.
#
# @private
#declare tag bingo.has_slot20
#>
# This tag marks a player who is in a team that obtained the item in slot 21.
#
# @private
#declare tag bingo.has_slot21
#>
# This tag marks a player who is in a team that obtained the item in slot 22.
#
# @private
#declare tag bingo.has_slot22
#>
# This tag marks a player who is in a team that obtained the item in slot 23.
#
# @private
#declare tag bingo.has_slot23
#>
# This tag marks a player who is in a team that obtained the item in slot 24.
#
# @private
#declare tag bingo.has_slot24

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