#> fetchr:tick/handle_new_player
#
# Function that is run for every new player
#
# @within tag/function fetchr:new_player
# @handles #fetchr:new_player

recipe give @s *
scoreboard players set @s fetchr.card_position 0
#NEUN_SCRIPT unless {NEUN_SCRIPT:realms}
tp ~ 1 ~

gamemode adventure
scoreboard players set @s fetchr.resource_pack_check 1
scoreboard players enable @s fetchr.resource_pack_check
effect give @s minecraft:weakness infinite 255 true
tag @s add fetchr.resourcepack_check
scoreboard players add @s fetchr.operator 0
#NEUN_SCRIPT end

#NEUN_SCRIPT if {NEUN_SCRIPT:realms}
#function fetchr:util/go_to_lobby
#NEUN_SCRIPT end

# Set player ID
#>
# Score holder which holds the next id.
# This is part of the fetchr.player_id objective
#
# @private
#declare score_holder $next
scoreboard players operation @s fetchr.player_id = $next fetchr.player_id
scoreboard players add $next fetchr.player_id 1

data modify storage fetchr:custom_hud players append value {}
execute \
	store result storage fetchr:custom_hud players[-1].id int 1 \
	run scoreboard players get @s fetchr.player_id
data \
	modify storage fetchr:custom_hud players[-1].components \
	set from storage fetchr:custom_hud default
#NEUN_SCRIPT remove 1
tag @s[name=NeunEinser] add fetchr.enable_manual_gamemode_switch

execute \
	in fetchr:lobby \
	as @e[type=minecraft:marker,tag=fetchr.lobby_sign] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,x=0,tag=fetchr.lobby_sign]
execute \
	in fetchr:lobby \
	as @e[type=minecraft:marker,tag=fetchr.card_frame_start] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,x=0,tag=fetchr.card_frame_start]

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

scoreboard players set @s fetchr.update_hud 1