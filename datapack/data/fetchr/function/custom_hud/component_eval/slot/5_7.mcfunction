#> fetchr:custom_hud/component_eval/slot/5_7
#
# Binary tree
#
# @within function fetchr:custom_hud/component_eval/slot/5_10

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 5 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true },\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.iconFont[5]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "interpret": true }\
			],\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.iconSeparatorAlignRight",\
					"interpret": true, "font": "fetchr:line5"\
				},\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.textComponent", "interpret": true }\
			],\
			"\\uffa5"\
		]'
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 6 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true },\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.iconFont[6]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "interpret": true }\
			],\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.iconSeparatorAlignRight",\
					"interpret": true, "font": "fetchr:line6"\
				},\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.textComponent", "interpret": true }\
			],\
			"\\uffa5"\
		]'
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 7 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true },\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.iconFont[7]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "interpret": true }\
			],\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.iconSeparatorAlignRight",\
					"interpret": true, "font": "fetchr:line7"\
				},\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.textComponent", "interpret": true }\
			],\
			"\\uffa5"\
		]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 5 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true },\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.iconFont[5]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", interpret: true }\
			],\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.iconSeparatorAlignRight",\
					interpret: true, font: "fetchr:line5"\
				},\
				{ storage: "io.fetchr:custom_hud", nbt: "component.textComponent", interpret: true }\
			],\
			"\uffa5"\
		]
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 6 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true },\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.iconFont[6]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", interpret: true }\
			],\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.iconSeparatorAlignRight",\
					interpret: true, font: "fetchr:line6"\
				},\
				{ storage: "io.fetchr:custom_hud", nbt: "component.textComponent", interpret: true }\
			],\
			"\uffa5"\
		]
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 7 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true },\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.iconFont[7]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", interpret: true }\
			],\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.iconSeparatorAlignRight",\
					interpret: true, font: "fetchr:line7"\
				},\
				{ storage: "io.fetchr:custom_hud", nbt: "component.textComponent", interpret: true }\
			],\
			"\uffa5"\
		]
#NEUN_SCRIPT end