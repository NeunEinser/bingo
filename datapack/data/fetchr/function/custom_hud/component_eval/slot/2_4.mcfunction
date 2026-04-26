#> fetchr:custom_hud/component_eval/slot/2_4
#
# Binary tree
#
# @within function fetchr:custom_hud/component_eval/slot/0_4

#NEUN_SCRIPT until 69
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 2 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			"\\uffa5",\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.text_component",\
					"interpret": true,\
					"font": "fetchr:line8"\
				},\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_separator_align_right", "interpret": true }\
			],\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_font[8]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "shadow_color": 0, "interpret": true }\
			],\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true }\
		]'
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 3 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			"\\uffa5",\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.text_component",\
					"interpret": true,\
					"font": "fetchr:line9"\
				},\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_separator_align_right", "interpret": true }\
			],\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_font[9]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "shadow_color": 0, "interpret": true }\
			],\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true }\
		]'
#execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 4 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '[\
			"\\uffa5",\
			[\
				{\
					"storage": "io.fetchr:custom_hud",\
					"nbt": "component.text_component",\
					"interpret": true,\
					"font": "fetchr:line10"\
				},\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_separator_align_right", "interpret": true }\
			],\
			[\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon_font[10]", "interpret": true },\
				{ "storage": "io.fetchr:custom_hud", "nbt": "component.icon", "shadow_color": 0, "interpret": true }\
			],\
			{ "storage": "io.fetchr:custom_hud", "nbt": "component.padding", "interpret": true }\
		]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 2 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			"\uffa5",\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.text_component",\
					interpret: true,\
					font: "fetchr:line8"\
				},\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_separator_align_right", interpret: true }\
			],\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_font[8]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", shadow_color: 0, interpret: true }\
			],\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true }\
		]
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 3 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			"\uffa5",\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.text_component",\
					interpret: true,\
					font: "fetchr:line9"\
				},\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_separator_align_right", interpret: true }\
			],\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_font[9]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", shadow_color: 0, interpret: true }\
			],\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true }\
		]
execute \
	if score $custom_hud/eval.slot fetchr.tmp matches 4 \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value [\
			"\uffa5",\
			[\
				{\
					storage: "io.fetchr:custom_hud",\
					nbt: "component.text_component",\
					interpret: true,\
					font: "fetchr:line10"\
				},\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_separator_align_right", interpret: true }\
			],\
			[\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon_font[10]", interpret: true },\
				{ storage: "io.fetchr:custom_hud", nbt: "component.icon", shadow_color: 0, interpret: true }\
			],\
			{ storage: "io.fetchr:custom_hud", nbt: "component.padding", interpret: true }\
		]
#NEUN_SCRIPT end