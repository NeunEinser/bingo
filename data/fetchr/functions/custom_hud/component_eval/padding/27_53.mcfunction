#> fetchr:custom_hud/component_eval/padding/27_53
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_80

execute if score $custom_hud/width.padding fetchr.io matches ..35 run function fetchr:custom_hud/component_eval/padding/27_35
execute if score $custom_hud/width.padding fetchr.io matches 36..44 run function fetchr:custom_hud/component_eval/padding/36_44
execute if score $custom_hud/width.padding fetchr.io matches 45.. run function fetchr:custom_hud/component_eval/padding/45_53
