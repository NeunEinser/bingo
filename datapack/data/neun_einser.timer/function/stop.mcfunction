#> neun_einser.timer:stop
#
# Stops the timer.
#
# @api

#NEUN_SCRIPT until 90
#worldborder set 59999968
#NEUN_SCRIPT end
#NEUN_SCRIPT since 90
stopwatch remove neun_einser.timer:timer
#NEUN_SCRIPT end
scoreboard players reset $start 91.timer.intern
scoreboard players set $in_game 91.timer.intern 0
scoreboard players set $ticks 91.timer.io 0