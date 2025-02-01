#> fetchr:custom_hud/components/timer/update/5190_6810
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/3732_8268

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..5722 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013F"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 5723..6277 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0100"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 6278.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0101"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..5722 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u013F"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 5723..6277 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0100"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 6278.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0101"
#NEUN_SCRIPT end
