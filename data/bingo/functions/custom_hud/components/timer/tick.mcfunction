#> bingo:custom_hud/components/timer/tick
#
# @within tag/function bingo:tick_hud_components
# @handles #bingo:tick_hud_components

#>
# @private
#declare score_holder $custom_hud/timer.last
execute unless score $last_tick bingo.state matches -2147483648.. run function bingo:custom_hud/components/timer/update
scoreboard players operation $custom_hud/timer.last bingo.tmp = $last_tick bingo.state
scoreboard players operation $custom_hud/timer.last bingo.tmp /= 100 bingo.const
#>
# @private
#declare score_holder $custom_hud/timer.cur
scoreboard players operation $custom_hud/timer.cur bingo.tmp = $raw 91.timer.time
scoreboard players operation $custom_hud/timer.cur bingo.tmp /= 100 bingo.const

execute unless score $custom_hud/timer.last bingo.tmp = $custom_hud/timer.cur bingo.tmp unless score $game_state bingo.state matches 1 run function bingo:custom_hud/components/timer/update
execute if score $game_state bingo.state matches 1 unless score $last_tick bingo.state matches 0 run function bingo:custom_hud/components/timer/update