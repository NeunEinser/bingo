#> neun_einser.timer:resume
#
# Resumes the timer after it has been paused.
#
# @api

#NEUN_SCRIPT until 90
#execute \
	unless score $in_game 91.timer.intern matches 2 \
	run worldborder set 59999000 59998
#NEUN_SCRIPT end
#NEUN_SCRIPT since 90
stopwatch create neun_einser.timer:timer
#NEUN_SCRIPT end

execute if score $in_game 91.timer.intern matches 2 run scoreboard players set $in_game 91.timer.intern 1

scoreboard players reset * 91.timer.total_ticks
scoreboard players reset * 91.timer.unpaused_ticks