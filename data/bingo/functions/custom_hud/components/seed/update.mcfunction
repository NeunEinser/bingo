#> bingo:custom_hud/components/seed/update
#
# @within function bingo:custom_hud/components/seed/tick

data modify storage io.bingo:custom_hud component set value {textComponent: '{"score":{"objective":"bingo.state","name":"$seed"}}', changed: true}
scoreboard players reset $custom_hud/width.number bingo.io
execute if score $seed bingo.state matches -2147483648.. run scoreboard players operation $custom_hud/width.number bingo.io = $seed bingo.state
scoreboard players set $custom_hud/width.padding bingo.io 78
function bingo:custom_hud/subtract_width

function bingo:custom_hud/component_post_evaluation
data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}] merge from storage io.bingo:custom_hud component