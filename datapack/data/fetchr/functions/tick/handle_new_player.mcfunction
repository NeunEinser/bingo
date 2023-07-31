#> fetchr:tick/handle_new_player
#
# Function that is run for every new player
#
# @within tag/function fetchr:new_player
# @handles #fetchr:new_player

recipe give @s *
scoreboard players set @s fetchr.card_position 0
tp ~ 1 ~

gamemode adventure
scoreboard players set @s fetchr.resource_pack_check 1
scoreboard players enable @s fetchr.resource_pack_check
effect give @s minecraft:weakness 1000000 255 true
tag @s add fetchr.resourcepack_check

setblock 1 2 2 minecraft:sea_lantern

scoreboard players add @s fetchr.operator 0

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
execute store result storage fetchr:custom_hud players[-1].id int 1 run scoreboard players get @s fetchr.player_id
data modify storage fetchr:custom_hud players[-1].components set from storage fetchr:custom_hud default
scoreboard players set @s fetchr.update_hud 1