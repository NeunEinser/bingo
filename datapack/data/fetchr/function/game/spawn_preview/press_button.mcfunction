#> fetchr:game/spawn_preview/press_button
#
# This function is called whenever a button in the lobby is pressed.
#
# @within advancement fetchr:press_button
# @context position location of the button

advancement revoke @s only fetchr:press_button

execute \
	unless entity @s[tag=fetchr.in_spawn_preview] \
	run return 0
execute \
	unless score $game_state fetchr.state matches 2 \
	run return 0

execute \
	as @e[type=minecraft:marker, tag=fetchr.spawn_preview_button, distance=..13] \
	at @s \
	if block ~ ~ ~ minecraft:stone_button[powered=true] \
	run tag @s add fetchr.pressed_button

execute \
	at @n[type=minecraft:marker, tag=fetchr.pressed_button, distance=..13] \
	run function fetchr:game/spawn_preview/button_pressed

tag @e[type=minecraft:marker, tag=fetchr.spawn_preview_button, distance=..13] remove fetchr.pressed_button