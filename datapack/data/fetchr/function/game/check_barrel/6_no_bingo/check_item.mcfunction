
$execute \
	if items block ~ ~ ~ container.$(slot_id) $(command_argument) \
	run scoreboard players add $game/goal_detection.success fetchr.tmp 0