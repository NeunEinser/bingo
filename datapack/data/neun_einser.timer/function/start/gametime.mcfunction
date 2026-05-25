#> neun_einser.timer:start/gametime
#
# Starts a new timer measuring in-game time.
#
# The percision is always in ticks.
#
# @api

#NEUN_SCRIPT until 90
#worldborder set 59999968
#NEUN_SCRIPT end
scoreboard players set $start 91.timer.intern 0
scoreboard players set $in_game 91.timer.intern 1
scoreboard players set $ticks 91.timer.intern 0

scoreboard players reset * 91.timer.total_ticks
scoreboard players reset * 91.timer.unpaused_ticks