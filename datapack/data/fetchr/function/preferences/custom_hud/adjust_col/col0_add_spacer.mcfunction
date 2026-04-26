#> fetchr:preferences/custom_hud/adjust_col/col0_add_spacer
#
# Adds a spacer in col 0
#
# @within function fetchr:preferences/custom_hud/adjust_col/col0
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
function fetchr:preferences/custom_hud/add_to_col0

scoreboard players set $preferences.next_page fetchr.tmp 9