execute \
	positioned ~3 ~-1 ~ \
	run function fetchr:game/check_barrel
execute \
	unless score $game/goal_detection.success fetchr.tmp matches 0 \
	run function fetchr:game/unlock_exit

execute \
	positioned ~ ~-1 ~3 \
	run function fetchr:game/check_barrel
execute \
	unless score $game/goal_detection.success fetchr.tmp matches 0 \
	run function fetchr:game/unlock_exit

execute \
	positioned ~-3 ~-1 ~ \
	run function fetchr:game/check_barrel
execute \
	unless score $game/goal_detection.success fetchr.tmp matches 0 \
	run function fetchr:game/unlock_exit

execute \
	positioned ~ ~-1 ~-3 \
	run function fetchr:game/check_barrel
execute \
	unless score $game/goal_detection.success fetchr.tmp matches 0 \
	run function fetchr:game/unlock_exit