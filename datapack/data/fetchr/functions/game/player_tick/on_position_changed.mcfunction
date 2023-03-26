#> fetchr:game/player_tick/on_position_changed
#
# This function runs for every player whose position changed
#
# @within function fetchr:game/player_tick
# @context
# 	entity The player
# 	location The player's position

fill ~-5 ~-5 ~-5 ~5 ~5 ~5 minecraft:air replace minecraft:light[waterlogged=false]
fill ~-5 ~-5 ~-5 ~5 ~5 ~5 minecraft:water replace minecraft:light[waterlogged=true]

execute if entity @s[gamemode=!spectator, scores={fetchr.lobby=0}] positioned over ocean_floor positioned ~-.1 ~-5 ~-.1 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~3 ~ ~ positioned over ocean_floor positioned ~-3 ~-5 ~ unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~7 ~ ~ positioned over ocean_floor positioned ~-7 ~-5 ~ unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~-3 ~ ~ positioned over ocean_floor positioned ~3 ~-5 ~ unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~-7 ~ ~ positioned over ocean_floor positioned ~7 ~-5 ~ unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~ ~ ~3 positioned over ocean_floor positioned ~ ~-5 ~-3 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~ ~ ~7 positioned over ocean_floor positioned ~ ~-5 ~-7 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~ ~ ~-3 positioned over ocean_floor positioned ~ ~-5 ~3 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~ ~ ~-7 positioned over ocean_floor positioned ~ ~-5 ~7 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~-5 ~ ~-5 positioned over ocean_floor positioned ~5 ~-5 ~5 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~-5 ~ ~5 positioned over ocean_floor positioned ~5 ~-5 ~-5 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~5 ~ ~-5 positioned over ocean_floor positioned ~-5 ~-5 ~5 unless entity @s[dx=0.2, dy=360, dz=0.2] positioned ~5 ~ ~5 positioned over ocean_floor positioned ~-5 ~-5 ~-5 unless entity @s[dx=0.2, dy=360, dz=0.2] at @s run function fetchr:game/player_tick/place_light_at_valid_pos
