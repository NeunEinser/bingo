#> neun_einser.timer:stop
#
# Stops the timer.
#
# @api

scoreboard players reset $start 91.timer.intern
scoreboard players reset $blocks_per_second 91.timer.intern
worldborder set 59999968
scoreboard players set $in_game 91.timer.intern 0
scoreboard players set $ticks 91.timer.io 0