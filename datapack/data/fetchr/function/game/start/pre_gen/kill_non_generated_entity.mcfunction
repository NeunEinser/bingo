#> fetchr:game/start/pre_gen/kill_non_generated_entity
#
# This removes all non-generated entities from the game.
#
# @within function fetchr:game/start/pre_gen/check_entities

execute \
	if entity @s[type=#fetchr:always_keep] \
	at @s \
	run function fetchr:game/start/pre_gen/freeze_entity
execute \
	if entity @s[type=#fetchr:always_keep] \
	run return 0

# data modify entity @s Glowing set value true

teleport @s ~151 -128 ~151
kill @s