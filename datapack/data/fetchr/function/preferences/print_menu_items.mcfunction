#> fetchr:preferences/print_menu_items
#
# This function prints all entries for menu items within the menu_options array
#
# @within
# 	fetchr:preferences/show
# 	fetchr:preferences/print_menu_items
# @context entity Player who triggered fetchr.pref
# @input storage io.fetchr:preferences menu_options

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences menu_option \
	set from storage io.fetchr:preferences menu_options[0]

execute \
	unless data storage tmp.fetchr:preferences menu_option{ disabled: true } \
	unless data storage tmp.fetchr:preferences menu_option{ hidden: true } \
	run tellraw @s [\
		"[",\
		{\
			"storage": "tmp.fetchr:preferences",\
			"nbt": "menu_option.click_event",\
			"interpret": true,\
			"color": "#00c3ff",\
			"extra": [\
				{\
					"storage": "tmp.fetchr:preferences",\
					"nbt": "menu_option.title",\
					"interpret": true,\
					"hoverEvent": {\
						"action": "show_text",\
						"contents": {\
							"storage": "tmp.fetchr:preferences",\
							"nbt": "menu_option.hover",\
							"interpret": true,\
							"color": "gold"\
						}\
					},\
					"hover_event": {\
						"action": "show_text",\
						"value": {\
							"storage": "tmp.fetchr:preferences",\
							"nbt": "menu_option.hover",\
							"interpret": true,\
							"color": "gold"\
						}\
					}\
				}\
			]\
		},\
		"]"\
	]

execute \
	if data storage tmp.fetchr:preferences menu_option{ disabled: true } \
	unless data storage tmp.fetchr:preferences menu_option{ hidden: true } \
	run tellraw @s [\
		"[",\
		{\
			"storage": "tmp.fetchr:preferences",\
			"nbt": "menu_option.title",\
			"interpret": true,\
			"color": "gray",\
			"hoverEvent": {\
				"action": "show_text",\
				"contents": {\
					"storage": "tmp.fetchr:preferences",\
					"nbt": "menu_option.disabled_hover",\
					"interpret": true,\
					"color": "yellow"\
				}\
			},\
			"hover_event": {\
				"action": "show_text",\
				"value": {\
					"storage": "tmp.fetchr:preferences",\
					"nbt": "menu_option.disabled_hover",\
					"interpret": true,\
					"color": "yellow"\
				}\
			}\
		},\
		"]"\
	]

data remove storage io.fetchr:preferences menu_options[0]
execute \
	if data storage io.fetchr:preferences menu_options[0] \
	run function fetchr:preferences/print_menu_items