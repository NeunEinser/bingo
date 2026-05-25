#> neun_einser.timer:start/realtime
#
# Starts a new timer measuring realtime time.
#
# @api

#NEUN_SCRIPT until 90
#worldborder damage amount 0
#worldborder set 50000000
#scoreboard players set $start 91.timer.intern -50000000
#worldborder set 59999000 9999
#scoreboard players set $in_game 91.timer.intern 0
#scoreboard players set $ticks 91.timer.intern 0
#scoreboard players set $last_worldborder_value 91.timer.intern 0

#scoreboard players reset * 91.timer.total_ticks
#scoreboard players reset * 91.timer.unpaused_ticks
#NEUN_SCRIPT end

#NEUN_SCRIPT since 90
scoreboard players set $start 91.timer.intern 0
scoreboard players set $in_game 91.timer.intern 0
scoreboard players set $ticks 91.timer.intern 0
stopwatch remove neun_einser.timer:timer
stopwatch create neun_einser.timer:timer
#NEUN_SCRIPT end