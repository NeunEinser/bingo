#> neun_einser.timer:start/hundredth_of_second
#
# Starts the time with hundreths of a second precision.
#
# @api

worldborder damage amount 0
worldborder set 50000000
scoreboard players set $start 91.timer.intern 50000000
worldborder set 59999900 99999
scoreboard players set $blocks_per_second 91.timer.intern 100
scoreboard players set $in_game 91.timer.intern 0

scoreboard players reset * 91.timer.total_ticks
scoreboard players reset * 91.timer.unpaused_ticks