#> fetchr:custom_hud/component_eval/padding/78_80
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/72_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 78 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u004e"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 79 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u004f"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 80 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0050"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 78 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u004e"
execute \
	if score $custom_hud/width.padding fetchr.io matches 79 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u004f"
execute \
	if score $custom_hud/width.padding fetchr.io matches 80 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0050"
#NEUN_SCRIPT end