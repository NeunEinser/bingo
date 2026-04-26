#> fetchr:preferences/custom_hud/adjust_col/col1_add_spacer
#
# Adds a spacer in col 1
#
# @within function fetchr:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud current_player.components

#NEUN_SCRIPT until 69
#data \
	modify storage tmp.fetchr:preferences/hud to_be_added \
	set value { id: "fetchr:spacer", name: '{ "translate": "fetchr.custom_hud.components.spacer" }' }
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data \
	modify storage tmp.fetchr:preferences/hud to_be_added \
	set value { id: "fetchr:spacer", name: { translate: "fetchr.custom_hud.components.spacer" } }
#NEUN_SCRIPT end
function fetchr:preferences/custom_hud/add_to_col1

scoreboard players set $preferences.next_page fetchr.tmp 10