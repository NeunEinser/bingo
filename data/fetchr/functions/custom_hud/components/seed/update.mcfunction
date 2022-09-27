#> fetchr:custom_hud/components/seed/update
#
# @within function fetchr:custom_hud/components/seed/tick

data modify storage io.fetchr:custom_hud component set from storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}]
data remove storage io.fetchr:custom_hud component.evaluated
data modify storage io.fetchr:custom_hud component merge value {textComponent: '{"score":{"objective":"fetchr.state","name":"$seed"}}', changed: true}
scoreboard players reset $custom_hud/width.number fetchr.io
execute if score $seed fetchr.state matches -2147483648.. run scoreboard players operation $custom_hud/width.number fetchr.io = $seed fetchr.state
scoreboard players set $custom_hud/width.padding fetchr.io 78
function fetchr:custom_hud/subtract_width

#>
# @private
#declare score_holder $custom_hud/seed.items
execute store result score $custom_hud/seed.items fetchr.tmp run data get storage fetchr:card teams[-1].itemCount
execute if score $seed fetchr.state matches -2147483648.. unless data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}].custom.fetchr{onlyShowAfterRun: true} run function fetchr:custom_hud/component_eval
execute if score $seed fetchr.state matches -2147483648.. if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}].custom.fetchr{onlyShowAfterRun: true} if score $game_state fetchr.state matches 2..3 if entity @s[predicate=fetchr:is_in_lobby] run function fetchr:custom_hud/component_eval
execute if score $seed fetchr.state matches -2147483648.. if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}].custom.fetchr{onlyShowAfterRun: true} if score $game_state fetchr.state matches 1..2 if entity @s[predicate=fetchr:is_in_game] if score $custom_hud/seed.items fetchr.tmp matches 25 run function fetchr:custom_hud/component_eval
data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}] set from storage io.fetchr:custom_hud component