#> bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1
#
# Attempts to adds the chunk coordinate to col 0 if the position is in column 1,
# but there is no space in column 1
#
# @within function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec

data modify storage tmp.bingo:preferences/hud toBeAdded set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
function bingo:preferences/custom_hud/add_to_col1