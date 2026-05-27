#> fetchr:tick/handle_new_player
#
# Function that is run for every new player
#
# @within tag/function fetchr:new_player
# @handles #fetchr:new_player

execute \
	in minecraft:overworld \
	run teleport 1 1 1

recipe give @s *
scoreboard players set @s fetchr.card_position 0
#NEUN_SCRIPT unless {NEUN_SCRIPT:realms}

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

scoreboard players set @s fetchr.update_hud 1