#> bingo:custom_hud/components/player_position/update_xz
#
# Updates the component for the player position
#
# @within function bingo:custom_hud/components/player_position/update
# @context entity Player whose hud is currently being updated

#>
# @within
# 	function bingo:custom_hud/components/player_position/update_xz
# 	function bingo:custom_hud/components/player_position/update_xz/*
#declare score_holder $custom_hud/player_pos.x_len
#>
# @within
# 	function bingo:custom_hud/components/player_position/update_xz
# 	function bingo:custom_hud/components/player_position/update_xz/*
#declare score_holder $custom_hud/player_pos.z_len

scoreboard players set $custom_hud/width.padding bingo.io 73
data modify storage io.bingo:custom_hud component set value {textComponent:'[{"score": {"name": "$custom_hud/player_pos.x", "objective": "bingo.tmp"}}, " ", {"score": {"name": "$custom_hud/player_pos.z", "objective": "bingo.tmp"}}]', changed: true}

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{iconType: "compass"} run function bingo:custom_hud/components/player_position/update_xz/set_compass_icon
execute unless data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{iconType: "compass"} run function bingo:custom_hud/components/player_position/update_xz/set_compass_text


execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{chunkCoordinatesOnTreasureMap: true} if entity @s[predicate=bingo:holding_treasure_map] run function bingo:custom_hud/components/player_position/update_xz/adjust_for_treasure_map

scoreboard players operation $custom_hud/width.number bingo.io = $custom_hud/player_pos.x bingo.tmp
function bingo:custom_hud/subtract_width

scoreboard players operation $custom_hud/player_pos.x_len bingo.tmp = $custom_hud/width.characters bingo.io
scoreboard players operation $custom_hud/width.number bingo.io = $custom_hud/player_pos.z bingo.tmp
function bingo:custom_hud/subtract_width

scoreboard players operation $custom_hud/player_pos.z_len bingo.tmp = $custom_hud/width.characters bingo.io
scoreboard players operation $custom_hud/width.characters bingo.io += $custom_hud/player_pos.x_len bingo.tmp

execute if score $custom_hud/width.characters bingo.io matches 12.. run function bingo:custom_hud/components/player_position/update_xz/shorten

function bingo:custom_hud/component_post_evaluation

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] merge from storage io.bingo:custom_hud component