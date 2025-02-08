#> fetchr:custom_hud/components/timer/update/20703_21685
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/20703_23745

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..21027 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0129"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 21028..21355 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012A"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 21356.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012B"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..21027 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0129"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 21028..21355 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u012A"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 21356.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u012B"
#NEUN_SCRIPT end
