#> fetchr:item_detection/handle_item_from_inventory/send_chat_message
#
# Sends a chat message with the constructed text component
#
# @params
#	item_text_component: #[text_component] string
# @within function fetchr:item_detection/handle_item_from_inventory/exec

#NEUN_SCRIPT until 65
#$tellraw @a [\
	"[ ",\
	{\
		"text": "≡",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.menu" },\
		"hoverEvent": { "action": "show_text", "contents": { "translate": "fetchr.game.menu.hover_text" }}\
	},\
	" ] ",\
	{\
		"translate": "fetchr.got_item",\
		"with": [\
			{ "score": { "name": "$item_detect/announce.items", "objective": "fetchr.tmp" }},\
			{ "storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true },\
			{ "selector": "@s" },\
			$(item_text_component)\
		]\
	}\
]
#NEUN_SCRIPT end