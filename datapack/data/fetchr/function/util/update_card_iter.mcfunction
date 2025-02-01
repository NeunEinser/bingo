#> fetchr:util/update_card_iter
#
# Updates the card for all teams
#
# @within
# 	function fetchr:util/update_card
# 	function fetchr:util/update_card_iter

data \
	modify storage tmp.fetchr:item_detect/update_card handledTeams \
	append from storage fetchr:card teams[0]
data remove storage fetchr:card teams[0]

#NEUN_SCRIPT until 65
#data \
	modify block 7 0 7 front_text.messages[0] \
	set value '[\
		"",\
		{ "text": "a", "font": "fetchr:card" },\
		"\\uff97",\
		[\
			{ "text": "", "font": "fetchr:actionbar_card/row0" },\
			{ "storage": "fetchr:card", "nbt": "slots[0].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[0]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[1].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[1]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[2].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[2]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[3].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[3]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[4].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[4]", "interpret": true }\
		],\
		"\\uff97",\
		[\
			{ "text": "", "font": "fetchr:actionbar_card/row1" },\
			{ "storage": "fetchr:card", "nbt": "slots[5].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[5]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[6].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[6]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[7].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[7]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[8].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[8]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[9].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[9]", "interpret": true }\
		],\
		"\\uff97",\
		[\
			{ "text": "", "font": "fetchr:actionbar_card/row2" },\
			{ "storage": "fetchr:card", "nbt": "slots[10].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[10]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[11].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[11]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[12].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[12]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[13].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[13]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[14].current_display", "interpret": true },\
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[14]", "interpret": true }\
		],\
		"\\uff97",\
		[\
			{ "text": "", "font": "fetchr:actionbar_card/row3" },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[15]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[16]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[17]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[18]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[19]", "interpret": true }\
		],\
		"\\uff97",\
		[\
			{ "text": "", "font": "fetchr:actionbar_card/row4" },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[20]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[21]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[22]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[23]", "interpret": true },\
			{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, \
			{ "text": "\\uffed", "font": "fetchr:space" },\
			{ "storage": "tmp.fetchr:item_detect/update_card", "nbt": "handledTeams[-1].slots[24]", "interpret": true }\
		],\
		"\\uff97"\
	]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify block 7 0 7 front_text.messages[0] \
	set value [\
		"",\
		{ text: "a", font: "fetchr:card" },\
		"\\uff97",\
		[\
			{ text: "", font: "fetchr:actionbar_card/row0" },\
			{ storage: "fetchr:card", nbt: "slots[0].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[0]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[1].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[1]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[2].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[2]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[3].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[3]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[4].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[4]", interpret: true }\
		],\
		"\\uff97",\
		[\
			{ text: "", font: "fetchr:actionbar_card/row1" },\
			{ storage: "fetchr:card", nbt: "slots[5].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[5]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[6].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[6]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[7].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[7]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[8].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[8]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[9].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[9]", interpret: true }\
		],\
		"\\uff97",\
		[\
			{ text: "", font: "fetchr:actionbar_card/row2" },\
			{ storage: "fetchr:card", nbt: "slots[10].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[10]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[11].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[11]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[12].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[12]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[13].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[13]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[14].current_display", interpret: true },\
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[14]", interpret: true }\
		],\
		"\\uff97",\
		[\
			{ text: "", font: "fetchr:actionbar_card/row3" },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[15]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[16]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[17]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[18]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[19]", interpret: true }\
		],\
		"\\uff97",\
		[\
			{ text: "", font: "fetchr:actionbar_card/row4" },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[20]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[21]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[22]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[23]", interpret: true },\
			{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, \
			{ text: "\\uffed", font: "fetchr:space" },\
			{ storage: "tmp.fetchr:item_detect/update_card", nbt: "handledTeams[-1].slots[24]", interpret: true }\
		],\
		"\\uff97"\
	]
#NEUN_SCRIPT end
data \
	modify storage tmp.fetchr:item_detect/update_card handledTeams[-1].card \
	set from block 7 0 7 front_text.messages[0]

execute \
	if data storage fetchr:card teams[0] \
	run function fetchr:util/update_card_iter