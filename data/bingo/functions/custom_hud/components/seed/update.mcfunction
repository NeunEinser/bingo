#> bingo:custom_hud/components/seed/update
#
# @within function bingo:custom_hud/components/seed/tick

data modify storage temp:bingo.custom_hud component set value {changed: true}
scoreboard players operation $custom_hud/width.number bingo.io = $seed bingo.state
scoreboard players set $custom_hud/width.padding bingo.io 78
function bingo:custom_hud/subtract_width

function bingo:custom_hud/calculate_padding
data modify storage temp:bingo.custom_hud component.padding set from storage io.bingo:custom_hud/padding padding
data modify storage bingo:custom_hud components[{id: "bingo:seed"}] merge from storage temp:bingo.custom_hud component