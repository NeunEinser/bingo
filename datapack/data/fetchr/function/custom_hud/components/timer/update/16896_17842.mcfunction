#> fetchr:custom_hud/components/timer/update/16896_17842
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/14973_17842

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..17211 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011D"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 17212..17527 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011E"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 17528.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011F"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..17211 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u011D"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 17212..17527 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u011E"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 17528.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u011F"
#NEUN_SCRIPT end
