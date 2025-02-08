#> fetchr:game/start/init_teams/light_blue
#
# Initializes the light_blue team
#
# @within function fetchr:game/start/init_teams

#NEUN_SCRIPT until 65
#data \
	modify block 7 0 7 front_text.messages[0] set value '[\
	{ "storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "aqua" },\
	{ "text": "\\uffeb", "font": "fetchr:space" }\
]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify block 7 0 7 front_text.messages[0] set value [\
	{ storage: "tmp.fetchr:game/start", nbt: "backgroundTemplate[0]", interpret: true, color: "aqua" },\
	{ text: "\uffeb", font: "fetchr:space" }\
]
#NEUN_SCRIPT end
data \
	modify storage fetchr:card teams[{ id: "fetchr:light_blue" }].background \
	set from block 7 0 7 front_text.messages[0]
#NEUN_SCRIPT until 65
#data \
	modify block 7 0 7 front_text.messages[0] set value '[\
	{ "storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "#8b8b8b" },\
	{ "text": "\\uffeb", "font": "fetchr:space" }\
]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify block 7 0 7 front_text.messages[0] set value [\
	{ storage: "tmp.fetchr:game/start", nbt: "backgroundTemplate[0]", interpret: true, color: "#8b8b8b" },\
	{ text: "\uffeb", font: "fetchr:space" }\
]
#NEUN_SCRIPT end
data \
	modify storage tmp.fetchr:game/start defaultBackground \
	append from block 7 0 7 front_text.messages[0]

data remove storage tmp.fetchr:game/start backgroundTemplate[0]