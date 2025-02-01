#> fetchr:custom_hud/component_eval/padding/90_91
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/81_91

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 90 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u005a"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 91 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u005b"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 90 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u005a"
execute \
	if score $custom_hud/width.padding fetchr.io matches 91 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u005b"
#NEUN_SCRIPT end
