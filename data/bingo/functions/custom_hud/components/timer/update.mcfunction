#> bingo:custom_hud/components/timer/update
#
# @internal

data modify storage io.bingo:custom_hud component set from storage bingo:custom_hud default[{id: "bingo:timer"}]
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
#>
# @within function bingo:custom_hud/components/timer/**
#declare score_holder $custom_hud/timer.padding
scoreboard players set $custom_hud/timer.padding bingo.tmp 33
execute if score $hours 91.timer.time matches ..99 run scoreboard players add $custom_hud/timer.padding bingo.tmp 6
execute if score $hours 91.timer.time matches ..9 run scoreboard players add $custom_hud/timer.padding bingo.tmp 6
execute if score $hours 91.timer.time matches 0 run scoreboard players add $custom_hud/timer.padding bingo.tmp 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches ..9 run scoreboard players add $custom_hud/timer.padding bingo.tmp 6
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 run scoreboard players add $custom_hud/timer.padding bingo.tmp 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 if score $seconds 91.timer.time matches ..9 run scoreboard players add $custom_hud/timer.padding bingo.tmp 6

# hide timer during pre-gen
execute if score $game_state bingo.state matches 0..2 run data modify storage io.bingo:custom_hud component.textComponent set value '"0"'
execute if score $game_state bingo.state matches 0..2 run scoreboard players set $custom_hud/timer.padding bingo.tmp 73

scoreboard players operation $custom_hud/width.padding bingo.io = $custom_hud/timer.padding bingo.tmp
function bingo:custom_hud/component_eval
data modify storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 0b}] set from storage io.bingo:custom_hud component
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", changed: false}] run function bingo:custom_hud/components/timer/eval_non_default