#> fetchr:custom_hud/component_eval/slot/8_10
#
# Binary tree
#
# @within function fetchr:custom_hud/component_eval/slot/5_10

#NEUN_SCRIPT until 69
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 8 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true },\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_font[8]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "shadow_color": 0, "interpret": true }\
			],\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.icon_separator_align_right",\
					"interpret": true,\
					"font": "fetchr:line8"\
				},\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.text_component",\
					"interpret": true\
				}\
			],\
			"\\uffa5"\
		]'
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 9 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true },\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_font[9]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "shadow_color": 0, "interpret": true }\
			],\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.icon_separator_align_right",\
					"interpret": true,\
					"font": "fetchr:line9"\
				},\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.text_component",\
					"interpret": true\
				}\
			],\
			"\\uffa5"\
		]'
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 10 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true },\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_font[10]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "shadow_color": 0, "interpret": true }\
			],\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.icon_separator_align_right",\
					"interpret": true,\
					"font": "fetchr:line10"\
				},\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.text_component",\
					"interpret": true\
				}\
			],\
			"\\uffa5"\
		]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 8 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true },\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_font[8]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", shadow_color: 0, interpret: true }\
			],\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.icon_separator_align_right",\
					interpret: true,\
					font: "fetchr:line8"\
				},\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.text_component",\
					interpret: true\
				}\
			],\
			"\uffa5"\
		]
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 9 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true },\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_font[9]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", shadow_color: 0, interpret: true }\
			],\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.icon_separator_align_right",\
					interpret: true,\
					font: "fetchr:line9"\
				},\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.text_component",\
					interpret: true\
				}\
			],\
			"\uffa5"\
		]
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 10 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true },\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_font[10]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", shadow_color: 0, interpret: true }\
			],\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.icon_separator_align_right",\
					interpret: true,\
					font: "fetchr:line10"\
				},\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.text_component",\
					interpret: true\
				}\
			],\
			"\uffa5"\
		]
#NEUN_SCRIPT end