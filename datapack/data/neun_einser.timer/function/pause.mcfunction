#> neun_einser.timer:pause
#
# Pauses the timer.
#
# @api

function neun_einser.timer:read
scoreboard players operation $start 91.timer.intern = $raw 91.timer.io

#NEUN_SCRIPT until 90
#execute \
	if score $in_game 91.timer.intern matches 0 \
	run scoreboard players remove $start 91.timer.intern 50000000
#execute \
	if score $in_game 91.timer.intern matches 0 \
	run worldborder set 50000000
#NEUN_SCRIPT end
#NEUN_SCRIPT since 90
execute \
	if score $in_game 91.timer.intern matches 0 \
	run stopwatch remove neun_einser.timer:timer
#NEUN_SCRIPT end
execute \
	if score $in_game 91.timer.intern matches 1 \
	run scoreboard players set $in_game 91.timer.intern 2