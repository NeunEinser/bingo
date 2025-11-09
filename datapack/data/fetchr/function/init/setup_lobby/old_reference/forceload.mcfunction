#> fetchr:init/setup_lobby/setup_lobby/old_reference/forceload
#
# This function checks if the lobby is completely forceloaded and then selects
# the correct structures to be generated as reference for an old version.
#
# @within function fetchr:init/setup_lobby/setup_reference

forceload add 16 -12 -57 18
execute at @e[type=minecraft:marker] run forceload add ~ ~
execute at @e[type=minecraft:area_effect_cloud] run forceload add ~ ~

scoreboard players set $init/lobby.is_loaded fetchr.tmp 0

execute \
	if loaded 16 0 -16 if loaded 16 0 0 if loaded 16 0 16 \
	if loaded 0 0 -16 if loaded 0 0 0 if loaded 0 0 16 \
	if loaded -16 0 -16 if loaded -16 0 0 if loaded -16 0 16 \
	if loaded -32 0 -16 if loaded -32 0 0 if loaded -32 0 16 \
	if loaded -48 0 -16 if loaded -48 0 0 if loaded -48 0 16 \
	if loaded -64 0 -16 if loaded -64 0 0 if loaded -64 0 16 \
	run scoreboard players set $init/lobby.is_loaded fetchr.tmp 1

execute \
	at @e[type=minecraft:marker] \
	unless loaded ~ ~ ~ \
	run scoreboard players set $init/lobby.is_loaded fetchr.tmp 0


execute \
	at @e[type=minecraft:area_effect_cloud] \
	unless loaded ~ ~ ~ \
	run scoreboard players set $init/lobby.is_loaded fetchr.tmp 0

execute \
	unless score $init/lobby.is_loaded fetchr.tmp matches 1 \
	run schedule function fetchr:init/setup_lobby/old_reference/run 1t

execute \
	if score $init/lobby.is_loaded fetchr.tmp matches 1 \
	run function fetchr:init/setup_lobby/old_reference/set_old_structures