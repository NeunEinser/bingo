
data modify entity @s Tags set value []
data modify entity @s Tags append from storage fetchr:items effects[]

execute \
	store result score $game/start.total_effects fetchr.tmp \
	run data get storage fetchr:items effects

scoreboard players set $mode fetchr.state 0
data modify entity @s Tags append value "minecraft:cave_exits"
execute \
	store result score $game/start.current_effects fetchr.tmp \
	run data get entity @s Tags
execute \
	if score $game/start.current_effects fetchr.tmp = $game/start.total_effects fetchr.tmp \
	run scoreboard players set $mode fetchr.state 1

data modify entity @s Tags set value []
data modify entity @s Tags append from storage fetchr:items effects[]
data modify entity @s Tags append value "minecraft:rare_surface_exits"
execute \
	store result score $game/start.current_effects fetchr.tmp \
	run data get entity @s Tags
execute \
	if score $game/start.current_effects fetchr.tmp = $game/start.total_effects fetchr.tmp \
	run scoreboard players set $mode fetchr.state 2

scoreboard players set $concealed_card fetchr.state 0
data modify entity @s Tags set value []
data modify entity @s Tags append from storage fetchr:items effects[]
data modify entity @s Tags append value "minecraft:no_drops"
execute \
	store result score $game/start.current_effects fetchr.tmp \
	run data get entity @s Tags
execute \
	if score $game/start.current_effects fetchr.tmp = $game/start.total_effects fetchr.tmp \
	run scoreboard players set $concealed_card fetchr.state 1

tag @s add fetchr.string_tester