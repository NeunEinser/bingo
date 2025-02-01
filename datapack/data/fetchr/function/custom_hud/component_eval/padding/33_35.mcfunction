#> fetchr:custom_hud/component_eval/padding/33_35
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/27_35

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 33 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0021"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 34 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0022"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 35 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0023"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 33 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0021"
execute \
	if score $custom_hud/width.padding fetchr.io matches 34 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0022"
execute \
	if score $custom_hud/width.padding fetchr.io matches 35 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0023"
#NEUN_SCRIPT end