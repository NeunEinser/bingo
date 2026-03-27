#> fetchr:card_frames/setup_frame
#
# Sets up the data for the current item frame
#
# @context entity The item frame
# @within
# 	function fetchr:card_frames/spawn_frames
# 	function fetchr:card_frames/spawn_iter

scoreboard players operation @s fetchr.lobby_card_frame_id = $card_frames/spawn.i fetchr.tmp

execute \
	unless score $concealed_card fetchr.state matches 1 \
	run data \
		modify entity @s Item \
		set from storage tmp.fetchr:card_frames/spawn_frames slots[0].item
data remove storage tmp.fetchr:card_frames/spawn_frames slots[0]
tag @s remove fetchr.new