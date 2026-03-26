#> fetchr:util/update_card
#
# Updates the card for all teams
#
# @internal

#>
# @within
# 	function fetchr:util/update_card
# 	function fetchr:util/update_card_iter
#declare storage tmp.fetchr:item_detect/update_card

data \
	modify block 7 0 7 front_text.messages[0] set value [\
	"",\
	{ text: "a", font: "fetchr:card" },\
	"\uffc1",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row2" },\
		{ storage: "fetchr:card", nbt: "slots[0].current_display", interpret: true }, { text: "\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[1].current_display", interpret: true }, { text: "\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[2].current_display", interpret: true }\
	],\
	"\uffc3",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row3" },\
		{ storage: "fetchr:card", nbt: "slots[3].current_display", interpret: true }, { text: "\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[4].current_display", interpret: true }, { text: "\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[5].current_display", interpret: true }\
	],\
	"\uffc3",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row4" },\
		{ storage: "fetchr:card", nbt: "slots[6].current_display", interpret: true }, { text: "\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[7].current_display", interpret: true }, { text: "\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[8].current_display", interpret: true }\
	],\
	"\uffc3"\
]
data \
	modify storage fetchr:card teams[0].card \
	set from block 7 0 7 front_text.messages[0]