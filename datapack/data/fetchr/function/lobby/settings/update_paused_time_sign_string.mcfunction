#> fetchr:lobby/settings/update_paused_time_sign_string
#
# Updates the paused time sign 
#
# @internal

#NEUN_SCRIPT until 69
#execute \
	if score $count_pauses 91.timer.io matches 0 \
	run data \
		modify storage fetchr:settings count_paused_time \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $count_pauses 91.timer.io matches 1 \
	run data \
		modify storage fetchr:settings count_paused_time \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $count_pauses 91.timer.io matches 0 \
	run data \
		modify storage fetchr:settings count_paused_time \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $count_pauses 91.timer.io matches 1 \
	run data \
		modify storage fetchr:settings count_paused_time \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end