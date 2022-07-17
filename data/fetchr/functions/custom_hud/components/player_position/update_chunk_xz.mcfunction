#> fetchr:custom_hud/components/player_position/update_chunk_xz
#
# Updates the component for the player chunk position
#
# @within function fetchr:custom_hud/components/player_position/update
# @context entity Player whose hud is currently being updated

scoreboard players operation $custom_hud/player_pos.x fetchr.tmp %= 16 fetchr.const
scoreboard players operation $custom_hud/player_pos.z fetchr.tmp %= 16 fetchr.const

data modify storage io.fetchr:custom_hud component set value {textComponent:'[{"score": {"name": "$custom_hud/player_pos.x", "objective": "fetchr.tmp"}}, " ", {"score": {"name": "$custom_hud/player_pos.z", "objective": "fetchr.tmp"}}]', changed: true}

scoreboard players set $custom_hud/width.padding fetchr.io 62
execute if score $custom_hud/player_pos.x fetchr.tmp matches 10.. run scoreboard players remove $custom_hud/width.padding fetchr.io 6
execute if score $custom_hud/player_pos.z fetchr.tmp matches 10.. run scoreboard players remove $custom_hud/width.padding fetchr.io 6

function fetchr:custom_hud/component_post_evaluation
data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:player_chunk_position"}] merge from storage io.fetchr:custom_hud component