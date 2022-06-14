#> bingo:custom_hud/components/player_position/update_chunk_xz
#
# Updates the component for the player chunk position
#
# @within function bingo:custom_hud/components/player_position/update
# @context entity Player whose hud is currently being updated

scoreboard players operation $custom_hud/player_pos.x bingo.tmp %= 16 bingo.const
scoreboard players operation $custom_hud/player_pos.z bingo.tmp %= 16 bingo.const

data modify storage io.bingo:custom_hud component set value {textComponent:'[{"score": {"name": "$custom_hud/player_pos.x", "objective": "bingo.tmp"}}, " ", {"score": {"name": "$custom_hud/player_pos.z", "objective": "bingo.tmp"}}]', changed: true}

scoreboard players set $custom_hud/width.padding bingo.io 62
execute if score $custom_hud/player_pos.x bingo.tmp matches 10.. run scoreboard players remove $custom_hud/width.padding bingo.io 6
execute if score $custom_hud/player_pos.z bingo.tmp matches 10.. run scoreboard players remove $custom_hud/width.padding bingo.io 6

function bingo:custom_hud/component_post_evaluation
data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}] merge from storage io.bingo:custom_hud component