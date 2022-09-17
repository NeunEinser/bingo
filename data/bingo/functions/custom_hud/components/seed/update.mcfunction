#> bingo:custom_hud/components/seed/update
#
# @within function bingo:custom_hud/components/seed/tick

data modify storage io.bingo:custom_hud component set from storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}]
data remove storage io.bingo:custom_hud component.evaluated
data modify storage io.bingo:custom_hud component merge value {textComponent: '{"score":{"objective":"bingo.state","name":"$seed"}}', changed: true}
scoreboard players reset $custom_hud/width.number bingo.io
execute if score $seed bingo.state matches -2147483648.. run scoreboard players operation $custom_hud/width.number bingo.io = $seed bingo.state
scoreboard players set $custom_hud/width.padding bingo.io 78
function bingo:custom_hud/subtract_width

#>
# @private
#declare score_holder $custom_hud/seed.items
execute store result score $custom_hud/seed.items bingo.tmp run data get storage bingo:card teams[-1].itemCount

execute if score $seed bingo.state matches -2147483648.. unless data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo{onlyShowAfterRun: true} run function bingo:custom_hud/component_eval
execute if score $seed bingo.state matches -2147483648.. if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo{onlyShowAfterRun: true} if score $game_state bingo.state matches 2..3 if entity @s[predicate=bingo:is_in_lobby] run function bingo:custom_hud/component_eval
execute if score $seed bingo.state matches -2147483648.. if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo{onlyShowAfterRun: true} if score $game_state bingo.state matches 1..2 if entity @s[predicate=bingo:is_in_game] if score $custom_hud/seed.items bingo.tmp matches 25 run function bingo:custom_hud/component_eval
data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}] set from storage io.bingo:custom_hud component