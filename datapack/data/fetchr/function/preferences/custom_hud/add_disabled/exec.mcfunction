#> fetchr:preferences/custom_hud/add_disabled/exec
#
# @within function fetchr:preferences/custom_hud/show
# @context entity Player who triggered fetchr.pref

scoreboard players set $preferences/hud.page fetchr.tmp 0
scoreboard players set $preferences/hud.element fetchr.tmp 0
data modify storage io.fetchr:preferences components set from storage fetchr:custom_hud components
function #fetchr:preferences/custom_hud/filter_disabled
data modify storage tmp.fetchr:preferences/hud pageElements set value []
data \
	modify storage tmp.fetchr:preferences/hud playerComponents \
	set from storage fetchr:custom_hud currentPlayer.components
data remove storage tmp.fetchr:preferences/hud playerComponents[{ id: "fetchr:empty" }]
function fetchr:preferences/custom_hud/select_page

execute \
	if score @s fetchr.pref matches 12..17 \
	run function fetchr:preferences/custom_hud/add_disabled/partition_0
execute \
	if score @s fetchr.pref matches 18..23 \
	run function fetchr:preferences/custom_hud/add_disabled/partition_1
execute \
	if score @s fetchr.pref matches 24..31 \
	run function fetchr:preferences/custom_hud/add_disabled/partition_2

#>
# @private
#declare score_holder $preferences/hud/add.col
scoreboard players operation $preferences/hud/add.col fetchr.tmp = @s fetchr.pref
scoreboard players operation $preferences/hud/add.col fetchr.tmp %= 2 fetchr.const

execute \
	if score $preferences/hud/add.col fetchr.tmp matches 0 \
	run function fetchr:preferences/custom_hud/add_to_col0
execute \
	if score $preferences/hud/add.col fetchr.tmp matches 1 \
	run function fetchr:preferences/custom_hud/add_to_col1

execute \
	unless data storage tmp.fetchr:preferences/hud pageElements[1] \
	run scoreboard players remove @s fetchr.menu_page 1

scoreboard players set $preferences.next_page fetchr.tmp 5
execute \
	if score @s fetchr.menu_page matches 0.. \
	run scoreboard players set $preferences.next_page fetchr.tmp 6