#> fetchr:card_frames/check_rotation
#
# This checks if an item has been rotated in an item frame.
#
# @within advancement fetchr:item_frame_interaction
# @context entity The player interacting with the item frame.

execute \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=..50, nbt=!{ ItemRotation: 0b }] \
	at @s \
	run function fetchr:card_frames/on_rotation_changed
advancement revoke @s only fetchr:item_frame_interaction