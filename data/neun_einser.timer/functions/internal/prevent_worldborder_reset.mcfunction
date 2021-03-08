#> neun_einser.timer:internal/prevent_worldborder_reset
#
# This is called when the worldborder was reset to distance 60,000,000, for
# example caused by reloading the world.
#
# @within function neun_einser.timer:internal/prevent_breakage

#>
# The amount of time that approximately passed since this function was called
# last
#
# @private
#declare score_holder $prevent_border_reset.approx_time

scoreboard players operation $start 91.timer.intern -= $last_worldborder_value 91.timer.intern

scoreboard players operation $prevent_border_reset.approx_time 91.timer.tmp = $blocks_per_second 91.timer.intern
scoreboard players operation $prevent_border_reset.approx_time 91.timer.tmp *= $ticks 91.timer.intern
scoreboard players operation $prevent_border_reset.approx_time 91.timer.tmp /= 20 91.timer.intern

scoreboard players operation $start 91.timer.intern -= $prevent_border_reset.approx_time 91.timer.intern