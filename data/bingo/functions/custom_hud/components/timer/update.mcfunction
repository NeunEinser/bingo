#> bingo:custom_hud/components/timer/update
#
# @within function bingo:custom_hud/components/timer/tick

data modify storage tmp.bingo:custom_hud component set value {textComponent:'{"storage":"neun_einser.timer:display","nbt":"hh:mm:ss","interpret":true}', changed: true}

scoreboard players set $custom_hud/width.padding bingo.io 45
execute if score $hours 91.timer.time matches ..99 run scoreboard players add $custom_hud/width.padding bingo.io 6
execute if score $hours 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding bingo.io 6
execute if score $hours 91.timer.time matches 0 run scoreboard players add $custom_hud/width.padding bingo.io 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding bingo.io 6
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 run scoreboard players add $custom_hud/width.padding bingo.io 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 if score $seconds 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding bingo.io 6

# hide timer during pre-gen
execute if score $game_state bingo.state matches 1 run data modify storage tmp.bingo:custom_hud component.textComponent set value '"0"'
execute if score $game_state bingo.state matches 1 run scoreboard players set $custom_hud/width.padding bingo.io 85

function bingo:custom_hud/calculate_padding
data modify storage tmp.bingo:custom_hud component.padding set from storage io.bingo:custom_hud/padding padding
data modify storage bingo:custom_hud components[{id: "bingo:timer"}] merge from storage tmp.bingo:custom_hud component