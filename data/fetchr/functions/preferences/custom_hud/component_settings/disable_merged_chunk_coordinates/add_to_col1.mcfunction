#> fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1
#
# Attempts to adds the chunk coordinate to col 0 if the position is in column 1,
# but there is no space in column 1
#
# @within function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec

data modify storage tmp.fetchr:preferences/hud toBeAdded set from storage fetchr:custom_hud components[{id: "fetchr:player_chunk_position"}]
function fetchr:preferences/custom_hud/add_to_col1