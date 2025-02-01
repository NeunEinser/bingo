#> fetchr:custom_hud/component_eval/padding/81_83
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/81_89

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 81 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0051"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 82 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0052"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 83 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0053"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 81 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0051"
execute \
	if score $custom_hud/width.padding fetchr.io matches 82 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0052"
execute \
	if score $custom_hud/width.padding fetchr.io matches 83 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0053"
#NEUN_SCRIPT end