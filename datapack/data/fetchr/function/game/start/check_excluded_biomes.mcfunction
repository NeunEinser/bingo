
scoreboard players set $start/check_dimension.should_skip fetchr.tmp 0

data modify entity @s Tags set value []
data modify entity @s Tags append from storage fetchr:items effects[]
execute \
	if score $start/check_dimension.special fetchr.tmp matches 0 \
	run data modify entity @s Tags append from storage tmp.fetchr:game/start exclude_surface[]
execute \
	if score $start/check_dimension.special fetchr.tmp matches 1 \
	run data modify entity @s Tags append from storage tmp.fetchr:game/start exclude_special[]

scoreboard players set $start/check_dimension.excluded fetchr.tmp 0
execute \
	if score $start/check_dimension.special fetchr.tmp matches 0 \
	store result score $start/check_dimension.excluded fetchr.tmp \
	run data get storage tmp.fetchr:game/start exclude_surface
execute \
	if score $start/check_dimension.special fetchr.tmp matches 1 \
	store result score $start/check_dimension.excluded fetchr.tmp \
	run data get storage tmp.fetchr:game/start exclude_special

execute \
	store result score $game/start.total_effects fetchr.tmp \
	run data get storage fetchr:items effects

execute \
	store result score $game/start.current_effects fetchr.tmp \
	run data get entity @s Tags

scoreboard players operation $game/start.current_effects fetchr.tmp -= $start/check_dimension.excluded fetchr.tmp

execute \
	unless score $game/start.current_effects fetchr.tmp = $game/start.total_effects fetchr.tmp \
	run scoreboard players set $start/check_dimension.should_skip fetchr.tmp 1

tag @s add fetchr.string_tester