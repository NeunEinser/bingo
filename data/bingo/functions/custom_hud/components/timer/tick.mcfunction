#> bingo:custom_hud/components/timer/tick
#
# @within tag/function bingo:tick_hud_components
# @handles #bingo:tick_hud_components

#>
# @private
#declare score_holder $custom_hud/timer.last
scoreboard players operation $custom_hud/timer.last bingo.tmp = $last_tick bingo.state
scoreboard players operation $custom_hud/timer.last bingo.tmp /= 100 bingo.const
#>
# @private
#declare score_holder $custom_hud/timer.cur
scoreboard players operation $custom_hud/timer.cur bingo.tmp = $raw 91.timer.time
scoreboard players operation $custom_hud/timer.cur bingo.tmp /= 100 bingo.const

execute unless score $custom_hud/timer.last bingo.tmp = $custom_hud/timer.cur bingo.tmp run function bingo:custom_hud/components/timer/update