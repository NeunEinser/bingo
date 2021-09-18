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

#>
# @private
#declare score_holder $custom_hud/timer.update_timer
scoreboard players set $custom_hud/timer.update_timer bingo.tmp 0

execute unless score $last_tick bingo.state matches -2147483648.. if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:timer"}] run scoreboard players set $custom_hud/timer.update_timer bingo.tmp 1
execute unless score $custom_hud/timer.last bingo.tmp = $custom_hud/timer.cur bingo.tmp unless score $game_state bingo.state matches 1 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:timer"}] run scoreboard players set $custom_hud/timer.update_timer bingo.tmp 1
execute if score $game_state bingo.state matches 1 unless score $last_tick bingo.state matches 0 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:timer"}] run scoreboard players set $custom_hud/timer.update_timer bingo.tmp 1
execute if score @s bingo.update_hud matches 1 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:timer"}] run scoreboard players set $custom_hud/timer.update_timer bingo.tmp 1

execute if score $custom_hud/timer.update_timer bingo.tmp matches 1 run function bingo:custom_hud/components/timer/update