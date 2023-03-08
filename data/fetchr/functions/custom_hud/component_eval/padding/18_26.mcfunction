#> fetchr:custom_hud/component_eval/padding/18_26
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_26

execute if score $custom_hud/width.padding fetchr.io matches ..20 run function fetchr:custom_hud/component_eval/padding/18_20
execute if score $custom_hud/width.padding fetchr.io matches 21..23 run function fetchr:custom_hud/component_eval/padding/21_23
execute if score $custom_hud/width.padding fetchr.io matches 24.. run function fetchr:custom_hud/component_eval/padding/24_26
