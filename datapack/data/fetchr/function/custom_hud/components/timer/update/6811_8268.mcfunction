#> fetchr:custom_hud/components/timer/update/6811_8268
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/3732_8268

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..7317 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0102"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 7318..7802 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0103"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 7803.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0104"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..7317 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0102"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 7318..7802 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0103"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 7803.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0104"
#NEUN_SCRIPT end
