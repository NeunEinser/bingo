#> neun_einser.timer:internal/handle_reset_world_border
#
# Resets the world border (MC-305239)
#
# @internal

scoreboard players operation $reset_wb.start 91.timer.intern = $ticks 91.timer.intern
scoreboard players operation $reset_wb.start 91.timer.intern *= $blocks_per_second 91.timer.intern
scoreboard players operation $reset_wb.start 91.timer.intern /= 20 91.timer.intern
scoreboard players operation $reset_wb.start 91.timer.intern -= $raw 91.timer.io

scoreboard players operation $reset_wb.start 91.timer.intern += $last_worldborder_value 91.timer.intern

scoreboard players operation $start 91.timer.intern -= $reset_wb.start 91.timer.intern