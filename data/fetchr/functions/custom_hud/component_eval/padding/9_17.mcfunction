#> fetchr:custom_hud/component_eval/padding/9_17
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_26

execute if score $custom_hud/width.padding fetchr.io matches ..11 run function fetchr:custom_hud/component_eval/padding/9_11
execute if score $custom_hud/width.padding fetchr.io matches 12..14 run function fetchr:custom_hud/component_eval/padding/12_14
execute if score $custom_hud/width.padding fetchr.io matches 15.. run function fetchr:custom_hud/component_eval/padding/15_17
