#> fetchr:custom_hud/component_eval/padding/66_68
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/63_71

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 66 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0042"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 67 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0043"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 68 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0044"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 66 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0042"
execute \
	if score $custom_hud/width.padding fetchr.io matches 67 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0043"
execute \
	if score $custom_hud/width.padding fetchr.io matches 68 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0044"
#NEUN_SCRIPT end