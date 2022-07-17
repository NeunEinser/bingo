#> fetchr:custom_hud/components/player_position/update_y
#
# Updates the component for the y position
#
# @within function fetchr:custom_hud/components/player_position/update
# @context entity Player whose hud is currently being updated

data modify storage io.fetchr:custom_hud component set value {textComponent:'["Y: ", {"score": {"name": "$custom_hud/player_pos.y", "objective": "fetchr.tmp"}}]', changed: true}
execute at @s run function fetchr:game/emerald_detection/chunk/detect
execute if entity @s[tag=fetchr.emerald] run data modify storage io.fetchr:custom_hud component.textComponent set value '[{"text": "Y: ", "color": "green"}, {"score": {"name": "$custom_hud/player_pos.y", "objective": "fetchr.tmp"}}]'

scoreboard players set $custom_hud/width.padding fetchr.io 79
scoreboard players operation $custom_hud/width.number fetchr.io = $custom_hud/player_pos.y fetchr.tmp
function fetchr:custom_hud/subtract_width
function fetchr:custom_hud/component_post_evaluation
data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:y_position"}] merge from storage io.fetchr:custom_hud component