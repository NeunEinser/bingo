#> neun_einser.timer:internal/display/store_hours
#
# Stores the hours component to the display storage.
#
# @internal

#NEUN_SCRIPT until 65
#data merge storage neun_einser.timer:display {\
	internal: {\
		hourSeparator: [":"],\
		hours: '{ "score": { "name": "$hours", "objective": "91.timer.io" }}'\
	}\
}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data merge storage neun_einser.timer:display {\
	internal: {\
		hourSeparator: [":"],\
		hours: { score: { name: "$hours", objective: "91.timer.io" }}\
	}\
}
#NEUN_SCRIPT end
execute \
	if score $minutes 91.timer.io matches ..9 \
	run data modify storage neun_einser.timer:display internal.hourSeparator append value "0"
function neun_einser.timer:internal/display/store_minutes