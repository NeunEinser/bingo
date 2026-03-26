

execute \
	if score $concealed_card fetchr.state matches 1 \
	run function fetchr:game/check_barrel/reveal_items

scoreboard players set $game/goal_detection.success fetchr.tmp 0
execute \
	if score $mode fetchr.state matches 0 \
	run function fetchr:game/check_barrel/bingo

execute \
	if score $mode fetchr.state matches 1 \
	run function fetchr:game/check_barrel/blackout

execute \
	if score $mode fetchr.state matches 1 \
	run function fetchr:game/check_barrel/6_no_bingo