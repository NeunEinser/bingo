#> fetchr:custom_hud/component_eval/padding/72_74
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/72_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 72 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0048"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 73 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0049"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 74 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u004a"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 72 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0048"
execute \
	if score $custom_hud/width.padding fetchr.io matches 73 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0049"
execute \
	if score $custom_hud/width.padding fetchr.io matches 74 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u004a"
#NEUN_SCRIPT end