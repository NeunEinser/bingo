#> fetchr:item_detection/check_and_announce/1
#
# Checks if another teammate got the item in the same tick, and announces the
# item get otherwise
#
# This function is supposed to be called for items 6..11 as a caching
# optimization, as each function only caches the last 8 calls.
#
# @params ::fetchr::storage::card::CardSlot
# @internal

$execute \
	unless items entity @s container.* $(command_argument) \
	unless items entity @s armor.* $(command_argument) \
	unless items entity @s weapon.offhand $(command_argument) \
	unless items entity @s player.crafting.* $(command_argument) \
	unless items entity @s player.cursor $(command_argument) \
	run return fail

scoreboard players set $item_detect.found_item fetchr.tmp 0
data remove storage tmp.fetchr:item_detect slot

$execute \
	if items entity @s weapon.* $(command_argument) \
	run function fetchr:item_detection/find_inventory_item/weapon_slots \
		with storage fetchr:card slots[$(slot_id)]
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s player.cursor $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "player.cursor"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	if items entity @s player.crafting.* $(command_argument) \
	run function fetchr:item_detection/find_inventory_item/crafting_slots \
		with storage fetchr:card slots[$(slot_id)]
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	if items entity @s hotbar.* $(command_argument) \
	run function fetchr:item_detection/find_inventory_item/hotbar_slots \
		with storage fetchr:card slots[$(slot_id)]
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	if items entity @s inventory.* $(command_argument) \
	run function fetchr:item_detection/find_inventory_item/inventory_slots \
		with storage fetchr:card slots[$(slot_id)]
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	if items entity @s armor.* $(command_argument) \
	run function fetchr:item_detection/find_inventory_item/armor_slots \
		with storage fetchr:card slots[$(slot_id)]

function fetchr:util/find_player_team
$tag @a[tag=fetchr.in_current_team] add fetchr.has_slot$(slot_id)

scoreboard players set $item_detect/set_overlay.success fetchr.tmp 0
#NEUN_SCRIPT until 65
#$execute \
	unless score $lockout_mode fetchr.state matches 1 \
	store success score $item_detect/set_overlay.success fetchr.tmp \
	run data \
		modify storage fetchr:card teams[-1].slots[$(slot_id)] \
		set value '{ "text": "\\uFFFE", "color": "black" }'
#$execute \
	if score $lockout_mode fetchr.state matches 1 \
	unless data storage fetchr:card slots[$(slot_id)].item_collected \
	store success score $item_detect/set_overlay.success fetchr.tmp \
	run data \
		modify storage fetchr:card teams[-1].slots[$(slot_id)] \
		set value '{ "text": "\\uFFFE", "color": "black" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
$execute \
	unless score $lockout_mode fetchr.state matches 1 \
	store success score $item_detect/set_overlay.success fetchr.tmp \
	run data \
		modify storage fetchr:card teams[-1].slots[$(slot_id)] \
		set value { text: "\uFFFE", color: "black" }
$execute \
	if score $lockout_mode fetchr.state matches 1 \
	unless data storage fetchr:card slots[$(slot_id)].item_collected \
	store success score $item_detect/set_overlay.success fetchr.tmp \
	run data \
		modify storage fetchr:card teams[-1].slots[$(slot_id)] \
		set value { text: "\uFFFE", color: "black" }
#NEUN_SCRIPT end
execute \
	unless score $item_detect/set_overlay.success fetchr.tmp matches 1 \
	run return fail

$scoreboard players set $item_detect.slot fetchr.tmp $(slot_id)

# Update item count
execute \
	store result score $item_detect/announce.items fetchr.tmp \
	run data get storage fetchr:card teams[-1].item_count
execute \
	store result storage fetchr:card teams[-1].item_count int 1 \
	run scoreboard players add $item_detect/announce.items fetchr.tmp 1

function neun_einser.timer:store_current_time
$data \
	modify storage tmp.fetchr:item_detect translation \
	set from storage fetchr:card slots[$(slot_id)].translation
function fetchr:item_detection/handle_item_from_inventory/exec \
	with storage tmp.fetchr:item_detect

data \
	modify storage io.fetchr:find_team current_team.color \
	set string storage fetchr:card teams[-1].id 7
function fetchr:item_detection/announce with storage io.fetchr:find_team current_team

#NEUN_SCRIPT until 65
#$data \
	modify block 7 0 7 front_text.messages[0] set value '[\
	"",\
	{ "storage": "fetchr:card", "nbt": "slots[$(slot_id)].background[]", "interpret": true, "separator": "" },\
	{ "text": "\\u0002", "font": "fetchr:space" },\
	{ "storage": "fetchr:card", "nbt": "slots[$(slot_id)].icon_display", "interpret": true }\
]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
$data \
	modify block 7 0 7 front_text.messages[0] set value [\
	"",\
	{ storage: "fetchr:card", nbt: "slots[$(slot_id)].background[]", interpret: true, separator: "" },\
	{ text: "\u0002", font: "fetchr:space" },\
	{ storage: "fetchr:card", nbt: "slots[$(slot_id)].icon_display", interpret: true }\
]
#NEUN_SCRIPT end

$data \
	modify storage fetchr:card slots[$(slot_id)].current_display \
	set from block 7 0 7 front_text.messages[0]

$data modify storage fetchr:card slots[$(slot_id)].item_collected set value true