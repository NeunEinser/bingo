#> fetchr:custom_hud/component_eval/padding/0_80
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval

execute if score $custom_hud/width.padding fetchr.io matches ..26 run function fetchr:custom_hud/component_eval/padding/0_26
execute if score $custom_hud/width.padding fetchr.io matches 27..53 run function fetchr:custom_hud/component_eval/padding/27_53
execute if score $custom_hud/width.padding fetchr.io matches 54.. run function fetchr:custom_hud/component_eval/padding/54_80
