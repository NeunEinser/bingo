#> fetchr:game/skybox/create_skybox/remove_old_skybox
#
# Removes an old skybox
#
# @within
# 	function fetchr:game/start/create_skybox/exec
# @context
# 	entity old skybox marker
# 	position old skybox location

fill ~-9 ~-2 ~-9 ~10 ~5 ~10 air

kill @e[type=minecraft:item, distance=..9]
kill @e[type=minecraft:marker, tag=fetchr.skybox_button, distance=..9]
kill @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=..9]
kill @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..9]

kill @s