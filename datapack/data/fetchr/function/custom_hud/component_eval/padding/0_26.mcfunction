#> fetchr:custom_hud/component_eval/padding/0_26
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_80

execute if score $custom_hud/width.padding fetchr.io matches ..8 run function fetchr:custom_hud/component_eval/padding/0_8
execute if score $custom_hud/width.padding fetchr.io matches 9..17 run function fetchr:custom_hud/component_eval/padding/9_17
execute if score $custom_hud/width.padding fetchr.io matches 18.. run function fetchr:custom_hud/component_eval/padding/18_26
