#> neun_einser.timer:internal/display/store_fractional_seconds
#
# Stores the fractional seconds component to the display storage.
#
# @internal

#NEUN_SCRIPT until 69
#data \
	modify storage neun_einser.timer:display internal merge value {\
		secondHundredthsSeparator: ["."],\
		secondMillisSeparator: ["."],\
		tens: '[\
			".",\
			{ "score": { "name": "$tens", "objective": "91.timer.io" }}\
		]',\
		hundredths: '[\
			{ "storage": "neun_einser.timer:display", "nbt": "internal.secondHundredthsSeparator", "interpret": true },\
			{ "score": { "name": "$hundredths", "objective": "91.timer.io" }}\
		]',\
		millis: '[\
			{ "storage": "neun_einser.timer:display", "nbt": "internal.secondMillisSeparator", "interpret": true },\
			{ "score": { "name": "$millis", "objective": "91.timer.io" }}\
		]'\
	}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data \
	modify storage neun_einser.timer:display internal merge value {\
		secondHundredthsSeparator: ["."],\
		secondMillisSeparator: ["."],\
		tens: [\
			".",\
			{ score: { name: "$tens", objective: "91.timer.io" }}\
		],\
		hundredths: [\
			{ storage: "neun_einser.timer:display", nbt: "internal.secondHundredthsSeparator", interpret: true },\
			{ score: { name: "$hundredths", objective: "91.timer.io" }}\
		],\
		millis: [\
			{ storage: "neun_einser.timer:display", nbt: "internal.secondMillisSeparator", interpret: true },\
			{ score: { name: "$millis", objective: "91.timer.io" }}\
		]\
	}
#NEUN_SCRIPT end
execute \
	if score $millis 91.timer.io matches ..9 \
	run data modify storage neun_einser.timer:display internal.secondMillisSeparator append value "0"
execute \
	if score $millis 91.timer.io matches ..99 \
	run data modify storage neun_einser.timer:display internal.secondMillisSeparator append value "0"
execute \
	if score $hundredths 91.timer.io matches ..9 \
	run data modify storage neun_einser.timer:display internal.secondHundredthsSeparator append value "0"