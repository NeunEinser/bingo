#> fetchr:card_generation/generate_card
#
# Generates a card using the set seed in nn.math.rand
#
# @within
# 	function fetchr:card_generation/random_card
# 	function fetchr:card_generation/generate_from_seed
# @input score $seed nn.math.rand
# @writes storage fetchr:card

#>
# @within function fetchr:card_generation/**
#declare storage tmp.fetchr:card_generation

function fetchr:game/end

scoreboard players set $update_card fetchr.state 1

#>
# The slot which is currently being generated
#
# @within function fetchr:card_generation/**
#declare score_holder $card_gen.slot
scoreboard players set $card_gen.slot fetchr.tmp 0
#>
# The current total weight of all remaining items of tmp.fetchr:card_generation
# items
#
# @within function fetchr:card_generation/**
#declare score_holder $card_gen.total_weight
scoreboard players operation $card_gen.total_weight fetchr.tmp = $total_item_weight fetchr.state
#>
# The current weight available per category. Might change if a category's total
# item weight changes in such a way that the available category weight cannot
# be split correctly.
#
# @within function fetchr:card_generation/**
#declare score_holder $card_gen.available_category_weight
scoreboard players operation $card_gen.available_category_weight fetchr.tmp = $available_category_weight fetchr.state
data modify storage tmp.fetchr:card_generation items set from storage fetchr:items active_items
data remove storage fetchr:card slots
data modify storage tmp.fetchr:rand_data min set value 1
execute \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame] \
	run data modify entity @s Item set value { id: "minecraft:barrier" }
function fetchr:card_generation/generate_slot

function neun_einser.math:random/next_full_int with storage tmp.fetchr:rand_data
execute \
	store result storage fetchr:card spawn_location int 1 \
	run scoreboard players get $rand.out 91.math.io

function neun_einser.math:random/next_full_int with storage tmp.fetchr:rand_data
execute \
	store result storage fetchr:card random_sequence_data.seed int 1 \
	run scoreboard players get $rand.out 91.math.io

# Reset teams
data modify storage fetchr:card teams set value [{ id: "fetchr:none" }]

#NEUN_SCRIPT until 65
#data \
	modify block 7 0 7 front_text.messages[0] set value '[\
	"",\
	{ "text": "a", "font": "fetchr:card" },\
	"\\uff97",\
	[\
		{ "text": "", "font": "fetchr:actionbar_card/row0" },\
		{ "storage": "fetchr:card", "nbt": "slots[0].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[1].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[2].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[3].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[4].current_display", "interpret": true }\
	],\
	"\\uff99",\
	[\
		{ "text": "", "font": "fetchr:actionbar_card/row1" },\
		{ "storage": "fetchr:card", "nbt": "slots[5].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[6].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[7].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[8].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[9].current_display", "interpret": true }\
	],\
	"\\uff99",\
	[\
		{ "text": "", "font": "fetchr:actionbar_card/row2" },\
		{ "storage": "fetchr:card", "nbt": "slots[10].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[11].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[12].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[13].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[14].current_display", "interpret": true }\
	],\
	"\\uff99",\
	[\
		{ "text": "", "font": "fetchr:actionbar_card/row3" },\
		{ "storage": "fetchr:card", "nbt": "slots[15].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[16].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[17].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[18].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[19].current_display", "interpret": true }\
	],\
	"\\uff99",\
	[\
		{ "text": "", "font": "fetchr:actionbar_card/row4" },\
		{ "storage": "fetchr:card", "nbt": "slots[20].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[21].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[22].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[23].current_display", "interpret": true }, { "text": "\\u0002", "font": "fetchr:space" },\
		{ "storage": "fetchr:card", "nbt": "slots[24].current_display", "interpret": true }\
	],\
	"\\uff99"\
]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify block 7 0 7 front_text.messages[0] set value [\
	"",\
	{ text: "a", font: "fetchr:card" },\
	"\\uff97",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row0" },\
		{ storage: "fetchr:card", nbt: "slots[0].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[1].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[2].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[3].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[4].current_display", interpret: true }\
	],\
	"\\uff99",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row1" },\
		{ storage: "fetchr:card", nbt: "slots[5].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[6].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[7].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[8].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[9].current_display", interpret: true }\
	],\
	"\\uff99",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row2" },\
		{ storage: "fetchr:card", nbt: "slots[10].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[11].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[12].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[13].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[14].current_display", interpret: true }\
	],\
	"\\uff99",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row3" },\
		{ storage: "fetchr:card", nbt: "slots[15].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[16].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[17].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[18].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[19].current_display", interpret: true }\
	],\
	"\\uff99",\
	[\
		{ text: "", font: "fetchr:actionbar_card/row4" },\
		{ storage: "fetchr:card", nbt: "slots[20].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[21].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[22].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[23].current_display", interpret: true }, { text: "\\u0002", font: "fetchr:space" },\
		{ storage: "fetchr:card", nbt: "slots[24].current_display", interpret: true }\
	],\
	"\\uff99"\
]
#NEUN_SCRIPT end
data \
	modify storage fetchr:card teams[0].card \
	set from block 7 0 7 front_text.messages[0]
execute \
	if score $blind_mode fetchr.state matches 1 \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame] \
	run data modify entity @s Item set value { id: "minecraft:barrier" }

scoreboard players reset * fetchr.neutral_display
scoreboard players reset * fetchr.black_display
scoreboard players reset * fetchr.blue_display
scoreboard players reset * fetchr.cyan_display
scoreboard players reset * fetchr.dark_blue_display
scoreboard players reset * fetchr.dark_gray_display
scoreboard players reset * fetchr.dark_red_display
scoreboard players reset * fetchr.gray_display
scoreboard players reset * fetchr.green_display
scoreboard players reset * fetchr.light_blue_display
scoreboard players reset * fetchr.lime_display
scoreboard players reset * fetchr.magenta_display
scoreboard players reset * fetchr.orange_display
scoreboard players reset * fetchr.purple_display
scoreboard players reset * fetchr.red_display
scoreboard players reset * fetchr.white_display
scoreboard players reset * fetchr.yellow_display

execute \
	as @e[tag=fetchr.card_frame, scores={fetchr.lobby_card_frame_id=12}, distance=0.., limit=1] \
	at @s \
	run playsound minecraft:entity.item_frame.add_item voice @a ~ ~ ~ 1 0.8

bossbar set fetchr:start/pre_gen/progress visible false

function fetchr:custom_hud/components/timer/update

#>
# @api
#declare tag/function fetchr:post_card_gen
function #fetchr:post_card_gen

schedule function fetchr:game/start/locate_spawnpoint 1s
