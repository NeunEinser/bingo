
function fetchr:game/check_barrel/bingo/row_0_0 with storage fetchr:card slots[0]
execute \
	if score $game/goal_detection.success fetchr.tmp matches 0 \
	run return 0

scoreboard players set $game/goal_detection.success fetchr.tmp 0
function fetchr:game/check_barrel/bingo/row_1_0 with storage fetchr:card slots[3]
execute \
	if score $game/goal_detection.success fetchr.tmp matches 0 \
	run return 0

scoreboard players set $game/goal_detection.success fetchr.tmp 0
function fetchr:game/check_barrel/bingo/row_1_0 with storage fetchr:card slots[6]