#> bingo:util/new_player
#
# Function that is run for every new player
#
# @within tag/function bingo:new_player
# @handles #bingo:new_player

team join bingo.dark_green
recipe give @s *

#>
# @private
#declare score_holder $new_player.request_resources

# Detect second (or more) players in a LAN world
execute store result score $new_player.request_resources bingo.tmp if entity @a
scoreboard players remove $new_player.request_resources bingo.tmp 1

# Detect the resource pack not being active server-side (So either we are on a
# server, or resourcepack is missing in single player for some reason)
summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:'{"translate": "bingo.technical.detect_multiplayer"}'}
execute if score $new_player.request_resources bingo.tmp matches 0 unless entity @e[name=Singleplayer, limit=1] run scoreboard players set $new_player.request_resources bingo.tmp 1
scoreboard players set $new_player.request_resources bingo.tmp 1
scoreboard players enable @s bingo.resources

execute if score $new_player.request_resources bingo.tmp matches 0 run function bingo:util/go_to_lobby
execute unless score $new_player.request_resources bingo.tmp matches 0 run gamemode adventure

# Set player ID
#>
# Score holder which holds the next id.
# This is part of the bingo.id objective
#
# @private
#declare score_holder $next
scoreboard players operation @s bingo.id = $next bingo.id
scoreboard players add $next bingo.id 1

data modify storage bingo:custom_hud players append value {}
execute store result storage bingo:custom_hud players[-1].id int 1 run scoreboard players get @s bingo.id
data modify storage bingo:custom_hud players[-1].components set from storage bingo:custom_hud default
scoreboard players set @s bingo.update_hud 1