#> fetchr:custom_hud/component_eval/padding/21_23
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/18_26

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 21 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0015"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 22 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0016"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 23 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0017"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 21 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0015"
execute \
	if score $custom_hud/width.padding fetchr.io matches 22 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0016"
execute \
	if score $custom_hud/width.padding fetchr.io matches 23 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0017"
#NEUN_SCRIPT end