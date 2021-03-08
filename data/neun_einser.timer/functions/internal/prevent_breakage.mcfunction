#> neun_einser.timer:internal/prevent_breakage
#
# Sanity checks to prevent overflow and reloads resetting the worldborder
#
# @internal
#>
# @private
#declare score_holder $prevent_breakage.start

execute if score $raw 91.timer.time matches 60000000 run function neun_einser.timer:internal/prevent_worldborder_reset
execute if score $raw 91.timer.time matches ..59999999 run scoreboard players operation $start 91.timer.intern -= $raw 91.timer.time

scoreboard players operation $prevent_breakage.start 91.timer.tmp = $start 91.timer.intern

execute if score $blocks_per_second 91.timer.intern matches 1000 run function neun_einser.timer:start/millis
execute if score $blocks_per_second 91.timer.intern matches 100 run function neun_einser.timer:start/hundredth_of_second
execute if score $blocks_per_second 91.timer.intern matches 10 run function neun_einser.timer:start/tenth_of_second
execute if score $blocks_per_second 91.timer.intern matches 1 run function neun_einser.timer:start/second

scoreboard players operation $raw 91.timer.time = $start 91.timer.time
scoreboard players operation $start 91.timer.intern += $prevent_breakage.start 91.timer.tmp