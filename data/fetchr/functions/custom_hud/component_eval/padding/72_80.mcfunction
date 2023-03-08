#> fetchr:custom_hud/component_eval/padding/72_80
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/54_80

execute if score $custom_hud/width.padding fetchr.io matches ..74 run function fetchr:custom_hud/component_eval/padding/72_74
execute if score $custom_hud/width.padding fetchr.io matches 75..77 run function fetchr:custom_hud/component_eval/padding/75_77
execute if score $custom_hud/width.padding fetchr.io matches 78.. run function fetchr:custom_hud/component_eval/padding/78_80
