#> fetchr:tick/handle_player_join
#
# This function runs for every player who just reconnected.
#
# @within tag/function fetchr:player_reconnect
# @handles #fetchr:player_reconnect
# @context entity Player who reconnected

function fetchr:util/find_player_team

execute if score $game_state fetchr.state matches 4 as @s[predicate=fetchr:is_in_game] run function fetchr:game/menu/print_with_hint

scoreboard players set @s fetchr.update_hud 1
trigger fetchr.resource_pack_check
execute unless score @s fetchr.game_id = $current_game_id fetchr.game_id if entity @s[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby
execute if score $game_state fetchr.state matches ..1 if entity @s[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby

#>
# @private
#declare score_holder $player_join.item_count
execute store result score $player_join.item_count fetchr.tmp run data get storage fetchr:card teams[-1].item_count

execute if score $player_join.item_count fetchr.tmp matches 25 run tag @s add fetchr.spectator

scoreboard players reset @s fetchr.reconnect
scoreboard players reset @s fetchr.setting_callback

execute \
	in fetchr:lobby \
	as @e[type=minecraft:marker,tag=fetchr.lobby_sign] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,tag=fetchr.lobby_sign,distance=...1]
execute \
	in fetchr:lobby \
	as @e[type=minecraft:marker,tag=fetchr.card_frame_start] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,tag=fetchr.card_frame_start,distance=...1]

execute \
	in fetchr:lobby \
	if entity @e[type=minecraft:marker,x=0,scores={fetchr.tmp=2..}] \
	run tellraw @s {\
		"translate": "fetchr.error.lobby_update.duplicated_entities",\
		"color": "red",\
		"fallback": "Something went wrong during your lobby upgrade. If you have a \
			backup of your world from before the upgrade, please send it to \
			NeunEinser over on %s or %s.",\
		"with": [\
			{\
				"text": "Discord",\
				"color": "#00c3ff",\
				"click_event": { "action": "open_url", "url": "https://discord.gg/9f6E3AxGA8" },\
				"clickEvent": { "action": "open_url", "value": "https://discord.gg/9f6E3AxGA8" }\
			},\
			{\
				"text": "Github",\
				"color": "#00c3ff",\
				"click_event": { "action": "open_url", "url": "https://github.com/NeunEinser/bingo/issues/304" },\
				"clickEvent": { "action": "open_url", "value": "https://github.com/NeunEinser/bingo/issues/304" }\
			}\
		]\
	}
scoreboard players reset @e[type=minecraft:marker,x=0] fetchr.tmp

execute if entity @s[predicate=fetchr:is_in_lobby] run schedule function fetchr:lobby/place_indestructible_blocks 1t replace