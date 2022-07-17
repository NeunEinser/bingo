#> fetchr:custom_hud/components/timer/tick
#
# @within tag/function fetchr:tick_hud_components
# @handles #fetchr:tick_hud_components

#>
# @private
#declare score_holder $custom_hud/timer.last
scoreboard players operation $custom_hud/timer.last fetchr.tmp = $last_tick fetchr.state
scoreboard players operation $custom_hud/timer.last fetchr.tmp /= 100 fetchr.const
#>
# @private
#declare score_holder $custom_hud/timer.cur
scoreboard players operation $custom_hud/timer.cur fetchr.tmp = $raw 91.timer.time
scoreboard players operation $custom_hud/timer.cur fetchr.tmp /= 100 fetchr.const

#>
# @private
#declare score_holder $custom_hud/timer.update_timer
scoreboard players set $custom_hud/timer.update_timer fetchr.tmp 0

execute unless score $last_tick fetchr.state matches -2147483648.. if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:timer"}] run scoreboard players set $custom_hud/timer.update_timer fetchr.tmp 1
execute unless score $custom_hud/timer.last fetchr.tmp = $custom_hud/timer.cur fetchr.tmp unless score $game_state fetchr.state matches 0..2 if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:timer"}] run scoreboard players set $custom_hud/timer.update_timer fetchr.tmp 1
execute if score $game_state fetchr.state matches 0..2 unless score $last_tick fetchr.state matches 0 if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:timer"}] run scoreboard players set $custom_hud/timer.update_timer fetchr.tmp 1
execute if score @s fetchr.update_hud matches 1 if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:timer"}] run scoreboard players set $custom_hud/timer.update_timer fetchr.tmp 1

execute if score $custom_hud/timer.update_timer fetchr.tmp matches 1 run function fetchr:custom_hud/components/timer/update