#> fetchr:lobby/place_indestructible_blocks
#
# Place indistructible blocks.
#
# Players may be in survival mode like in old-school bingo. This function
# ensures nothing crucial can be broken.
#
# @internal

#>
# @private
#declare tag fetchr.sign_lobby_end_sign

#NEUN_SCRIPT unless realms
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	as @e[type=minecraft:marker, tag=fetchr.multiplayer_door] \
	at @s unless block ~ ~ ~ minecraft:iron_door \
	run setblock ~ ~ ~ minecraft:iron_door[facing=south]
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	as @e[type=minecraft:marker, tag=fetchr.multiplayer_door] \
	at @s unless block ~ ~1 ~ minecraft:iron_door \
	run setblock ~ ~1 ~ minecraft:iron_door[facing=south, half=upper]
execute \
	if score $is_multiplayer fetchr.state matches 0 \
	as @e[type=minecraft:marker, tag=fetchr.multiplayer_door] \
	at @s \
	run fill ~ ~ ~ ~ ~1 ~ minecraft:gray_concrete
#NEUN_SCRIPT end
execute \
	as @e[type=minecraft:marker, tag=fetchr.lobby_sign] \
	at @s \
	run function fetchr:lobby/place_sign
execute \
	as @e[type=minecraft:marker, tag=fetchr.lobby_lectern] \
	at @s \
	unless block ~ ~ ~ minecraft:lectern[has_book=true] \
	run function fetchr:lobby/place_lectern
execute \
	as @e[type=minecraft:marker, tag=fetchr.lobby_enderchest] \
	at @s \
	unless block ~ ~ ~ minecraft:ender_chest \
	run setblock ~ ~ ~ minecraft:ender_chest[facing=east]
execute \
	as @e[tag=fetchr.mangrove_button_south] \
	at @s unless block ~ ~ ~ minecraft:mangrove_button \
	run setblock ~ ~ ~ minecraft:mangrove_button[facing=south]
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	as @e[tag=fetchr.multiplayer_mangrove_button_north] \
	at @s \
	if block ~ ~ ~ minecraft:warped_wall_sign \
	run setblock ~ ~ ~ minecraft:mangrove_button[facing=north]
execute \
	if score $is_multiplayer fetchr.state matches 0 \
	as @e[tag=fetchr.multiplayer_only, tag=!fetchr.multiplayer_only_no_replace] \
	at @s \
	if block ~ ~ ~ #fetchr:lobby_indestructible_blocks \
	run setblock ~ ~ ~ minecraft:air
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	as @e[tag=fetchr.singleplayer_only, tag=!fetchr.singleplayer_only_no_replace] \
	at @s \
	if block ~ ~ ~ #fetchr:lobby_indestructible_blocks \
	run setblock ~ ~ ~ minecraft:air
execute \
	if score $is_multiplayer fetchr.state matches 0 \
	as @e[tag=fetchr.multiplayer_only_brown] \
	at @s \
	run setblock ~ ~ ~ minecraft:brown_carpet
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	as @e[tag=fetchr.singleplayer_only_brown] \
	at @s \
	run setblock ~ ~ ~ minecraft:brown_carpet

execute \
	if entity @a[predicate=fetchr:is_in_lobby] \
	run schedule function fetchr:lobby/place_indestructible_blocks 1s
