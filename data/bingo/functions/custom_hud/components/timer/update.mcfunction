#> bingo:custom_hud/components/timer/update
#
# @within function bingo:custom_hud/components/timer/tick

data modify storage io.bingo:custom_hud component set from storage bingo:custom_hud currentPlayer.components[{id: "bingo:timer"}]
data modify storage io.bingo:custom_hud component merge value {icon: '"\\u0132"', changed: true}
data modify storage io.bingo:custom_hud component.textComponent set from storage neun_einser.timer:display "hh:mm:ss" 

# set icon
#>
# @within
# 	function bingo:custom_hud/components/timer/update
# 	function bingo:custom_hud/components/timer/update/*
#declare score_holder $custom_hud/timer.daytime
execute store result score $custom_hud/timer.daytime bingo.tmp run time query daytime

execute if score $custom_hud/timer.daytime bingo.tmp matches ..11894 run function bingo:custom_hud/components/timer/update/106_11894
execute if score $custom_hud/timer.daytime bingo.tmp matches 11895..20702 run function bingo:custom_hud/components/timer/update/11895_20702
execute if score $custom_hud/timer.daytime bingo.tmp matches 20703.. run function bingo:custom_hud/components/timer/update/20703_23745

execute if score $game_state bingo.state matches 0..1 run data modify storage io.bingo:custom_hud component.icon set value '"\\u0100"'

# padding
scoreboard players set $custom_hud/width.padding bingo.io 33
execute if score $hours 91.timer.time matches ..99 run scoreboard players add $custom_hud/width.padding bingo.io 6
execute if score $hours 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding bingo.io 6
execute if score $hours 91.timer.time matches 0 run scoreboard players add $custom_hud/width.padding bingo.io 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding bingo.io 6
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 run scoreboard players add $custom_hud/width.padding bingo.io 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 if score $seconds 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding bingo.io 6

# hide timer during pre-gen
execute if score $game_state bingo.state matches 0..2 run data modify storage io.bingo:custom_hud component.textComponent set value '"0"'
execute if score $game_state bingo.state matches 0..2 run scoreboard players set $custom_hud/width.padding bingo.io 73

function bingo:custom_hud/component_eval
data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:timer"}] set from storage io.bingo:custom_hud component