
data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 3 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[0].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 4 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[1].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 5 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[2].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 12 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[3].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 13 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[4].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 14 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[5].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 21 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[6].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 22 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[7].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

data modify storage tmp.fetchr:game/goal_detection data set value { slot_id: 23 }
data modify storage tmp.fetchr:game/goal_detection data.command_argument set from storage fetchr:card slots[8].command_argument
function fetchr:game/check_barrel/6_no_bingo/check_item with storage tmp.fetchr:game/goal_detection data

execute \
	unless score $game/goal_detection.success fetchr.tmp matches 6 \
	run scoreboard players set $game/goal_detection.success fetchr.tmp 0

execute \
	if score $game/goal_detection.success fetchr.tmp matches 0 \
	run return 0

scoreboard players set $game/goal_detection.success fetchr.tmp 0
function fetchr:game/check_barrel/bingo
execute \
	unless score $game/goal_detection.success fetchr.tmp matches 0 \
	run scoreboard players set $game/goal_detection.success fetchr.tmp -1
scoreboard players add $game/goal_detection.success fetchr.tmp 1