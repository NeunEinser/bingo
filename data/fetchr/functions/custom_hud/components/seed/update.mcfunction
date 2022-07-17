#> fetchr:custom_hud/components/seed/update
#
# @within function fetchr:custom_hud/components/seed/tick

data modify storage io.fetchr:custom_hud component set value {textComponent: '{"score":{"objective":"fetchr.state","name":"$seed"}}', icon: '"s"', iconWidth: '{"translate": "space.9"}', changed: true}
scoreboard players reset $custom_hud/width.number fetchr.io
execute if score $seed fetchr.state matches -2147483648.. run scoreboard players operation $custom_hud/width.number fetchr.io = $seed fetchr.state
scoreboard players set $custom_hud/width.padding fetchr.io 78
function fetchr:custom_hud/subtract_width

#>
# @private
#declare score_holder $custom_hud/seed.items
execute store result score $custom_hud/seed.items fetchr.tmp run data get storage fetchr:card teams[-1].itemCount
execute unless score $seed fetchr.state matches -2147483648.. run function fetchr:custom_hud/components/seed/hide_component
execute if score $game_state fetchr.state matches 0..1 if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}].custom.fetchr{onlyShowAfterRun: true} run function fetchr:custom_hud/components/seed/hide_component
execute if score $game_state fetchr.state matches 2..3 if entity @s[predicate=fetchr:is_in_game] if score $custom_hud/seed.items fetchr.tmp matches ..24 if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}].custom.fetchr{onlyShowAfterRun: true} run function fetchr:custom_hud/components/seed/hide_component

function fetchr:custom_hud/component_post_evaluation
data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:seed"}] merge from storage io.fetchr:custom_hud component