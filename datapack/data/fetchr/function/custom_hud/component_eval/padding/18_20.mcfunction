#> fetchr:custom_hud/component_eval/padding/18_20
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/18_26

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 18 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0012"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 19 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0013"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 20 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0014"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 18 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0012"
execute \
	if score $custom_hud/width.padding fetchr.io matches 19 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0013"
execute \
	if score $custom_hud/width.padding fetchr.io matches 20 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0014"
#NEUN_SCRIPT end