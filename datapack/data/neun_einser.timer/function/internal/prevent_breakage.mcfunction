#> neun_einser.timer:internal/prevent_breakage
#
# Sanity checks to prevent overflow and reloads resetting the worldborder
#
# @internal
#>
# @private
#declare score_holder $prevent_breakage.start

#NEUN_SCRIPT until 90
#scoreboard players operation $prevent_breakage.start 91.timer.tmp = $start 91.timer.intern
#scoreboard players operation $prevent_breakage.start 91.timer.tmp -= $raw 91.timer.io

#function neun_einser.timer:start/realtime

#scoreboard players operation $raw 91.timer.io = $start 91.timer.io
#scoreboard players operation $start 91.timer.intern -= $prevent_breakage.start 91.timer.tmp
#NEUN_SCRIPT end