#> fetchr:game/spawn_preview/create/remove_old_preview
#
# Removes an old spawn preview
#
# @within
# 	function fetchr:game/start/spawn_preview/create/exec
# @context
# 	entity old spawn preview marker
# 	position old spawn preview location

fill ~-9 ~-2 ~-9 ~10 ~5 ~10 air

kill @e[type=minecraft:item, distance=..9]
kill @e[type=minecraft:marker, tag=fetchr.spawn_preview_button, distance=..9]
kill @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=..9]
kill @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..9]

kill @s