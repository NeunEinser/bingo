scoreboard players set $start/check_dimension.special fetchr.tmp 0

data modify entity @s Tags set value []
data modify entity @s Tags append from storage fetchr:items effects[]
data modify entity @s Tags append value "minecraft:floating_islands_world"
data modify entity @s Tags append value "minecraft:cave_world"
data modify entity @s Tags append value "minecraft:dark_cave_world"
data modify entity @s Tags append value "minecraft:grid_world"

execute \
	store result score $game/start.total_effects fetchr.tmp \
	run data get storage fetchr:items effects

execute \
	store result score $game/start.current_effects fetchr.tmp \
	run data get entity @s Tags

scoreboard players remove $game/start.current_effects fetchr.tmp 4

execute \
	unless score $game/start.current_effects fetchr.tmp = $game/start.total_effects fetchr.tmp \
	run scoreboard players set $start/check_dimension.special fetchr.tmp 1

tag @s add fetchr.string_tester