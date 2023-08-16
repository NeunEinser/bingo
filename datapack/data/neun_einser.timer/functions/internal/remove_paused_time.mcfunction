#> neun_einser.timer:internal/remove_paused_time
#
# Detects game pauses and subtracts the paused time from the timer.
#
# @internal

#>
# @private
#declare score_holder $pause_detction.paused_time
scoreboard players operation $pause_detction.paused_time 91.timer.intern = @s 91.timer.total_ticks
scoreboard players operation $pause_detction.paused_time 91.timer.intern -= @s 91.timer.unpaused_ticks

scoreboard players operation $pause_detction.paused_time 91.timer.intern *= $blocks_per_second 91.timer.intern
scoreboard players operation $pause_detction.paused_time 91.timer.intern /= 20 91.timer.intern

execute if score $pause_detction.paused_time 91.timer.intern matches 0 run return 0

scoreboard players operation $start 91.timer.intern += $pause_detction.paused_time 91.timer.intern

scoreboard players reset * 91.timer.total_ticks
scoreboard players reset * 91.timer.unpaused_ticks