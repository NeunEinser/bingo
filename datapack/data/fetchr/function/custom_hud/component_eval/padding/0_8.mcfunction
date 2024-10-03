#> fetchr:custom_hud/component_eval/padding/0_8
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_26

execute if score $custom_hud/width.padding fetchr.io matches ..2 run function fetchr:custom_hud/component_eval/padding/0_2
execute if score $custom_hud/width.padding fetchr.io matches 3..5 run function fetchr:custom_hud/component_eval/padding/3_5
execute if score $custom_hud/width.padding fetchr.io matches 6.. run function fetchr:custom_hud/component_eval/padding/6_8
