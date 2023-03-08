#> fetchr:custom_hud/component_eval/padding/39_41
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/36_44

execute if score $custom_hud/width.padding fetchr.io matches 39 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0027"'
execute if score $custom_hud/width.padding fetchr.io matches 40 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0028"'
execute if score $custom_hud/width.padding fetchr.io matches 41 run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0029"'
