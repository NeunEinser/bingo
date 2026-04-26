#> fetchr:preferences/custom_hud/logic
#
# @within tag/function fetchr:preferences/custom_hud
# @handles #fetchr:preferences/custom_hud
# @context entity Player who triggered fetchr.pref
# @reads
# 	storage fetchr:custom_hud components
# 	storage fetchr:custom_hud current_player.components

#> 
# @private
#declare score_holder $preferences/hud.total_count
execute \
	store result score $preferences/hud.total_count fetchr.tmp \
	run data get storage fetchr:custom_hud components
#> 
# @private
#declare score_holder $preferences/hud.enabled_count

# Workaround for https://bugs.mojang.com/browse/MC-236889 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud active_components \
	set from storage fetchr:custom_hud current_player.components
data remove storage tmp.fetchr:preferences/hud active_components[{ id: "fetchr:empty" }]
data remove storage tmp.fetchr:preferences/hud active_components[{ id: "fetchr:spacer" }]

execute \
	store result score $preferences/hud.enabled_count fetchr.tmp \
	run data get storage tmp.fetchr:preferences/hud active_components
execute \
	if data \
		storage fetchr:custom_hud \
		current_player\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ chunkCoordinatesOnTreasureMap: true } \
	run scoreboard players add $preferences/hud.enabled_count fetchr.tmp 1

execute \
	if score $preferences/hud.enabled_count fetchr.tmp = $preferences/hud.total_count fetchr.tmp \
	run data \
		modify storage io.fetchr:preferences menu_options[{ id: "fetchr:custom_hud/add_disabled" }].disabled \
		set value true

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:preferences/hud component set from storage fetchr:custom_hud current_player.components[0]
execute \
	if data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run data \
		modify storage io.fetchr:preferences menu_options[{ id: "fetchr:custom_hud/adjust_col0" }].disabled \
		set value true

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud component \
	set from storage fetchr:custom_hud current_player.components[5]
execute \
	if data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run data \
		modify storage io.fetchr:preferences menu_options[{ id: "fetchr:custom_hud/adjust_col1" }].disabled \
		set value true