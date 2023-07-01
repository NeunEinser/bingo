#> fetchr:card_frames/spawn_frames
#
# Iterates 25 times to spawn 25 item frames to be used for displaying the crad
# in the lobby.
#
# Already creates each frame at the correct location
#
# @within function fetchr:card_frames/spawn
# @context
# 	location Location where next item frame needs to be placed, starting from
# 		top left

scoreboard players set $card_frames/spawn.i fetchr.tmp 0
data modify storage tmp.fetchr:card_frames/spawn_frames slots set from storage fetchr:card slots
function fetchr:card_frames/spawn_iter