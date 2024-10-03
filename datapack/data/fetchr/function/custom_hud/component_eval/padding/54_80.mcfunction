#> fetchr:custom_hud/component_eval/padding/54_80
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/0_80

execute if score $custom_hud/width.padding fetchr.io matches ..62 run function fetchr:custom_hud/component_eval/padding/54_62
execute if score $custom_hud/width.padding fetchr.io matches 63..71 run function fetchr:custom_hud/component_eval/padding/63_71
execute if score $custom_hud/width.padding fetchr.io matches 72.. run function fetchr:custom_hud/component_eval/padding/72_80
