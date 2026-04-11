#> fetchr:init/update_lobby/update_entity/exec
#
# Tries to find a corresponding entity with the same display_entity_id in the
# reference, and if successful updates the old one and teleports it to it's
# new location in the clone.
#
# @within
# 	function fetchr:init/update_lobby/update_structure
# @context
# 	entity The entity to update
# 	dimension fetchr:lobby

# Get display entity id and return if missing
data remove storage tmp.fetchr:init/update_lobby update_entity.entity_id
data \
	modify storage tmp.fetchr:init/update_lobby update_entity.entity_id \
	set from entity @s data.fetchr.display_entity_id

execute \
	unless data entity @s data.fetchr.display_entity_id \
	on passengers \
	run data \
		modify storage tmp.fetchr:init/update_lobby update_entity.entity_id \
		set from entity @s data.fetchr.display_entity_id

execute \
	unless data storage tmp.fetchr:init/update_lobby update_entity.entity_id \
	run return 0

# Get entity type id
summon minecraft:text_display ~ ~ ~ {Tags: ["fetchr.vehicle"]}
ride @s mount @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1]
data \
	modify storage tmp.fetchr:init/update_lobby update_entity.entity_type \
	set from entity @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1] Passengers[0].id
kill @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1]

# Setup macro arguments and find reference
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.size_x int 1 \
	run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.size_y int 1 \
	run scoreboard players get $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.size_z int 1 \
	run scoreboard players get $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_entity.old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp

function fetchr:init/update_lobby/update_entity/find_corresponding_in_reference \
	with storage tmp.fetchr:init/update_lobby update_entity

# If reference and old is found, update old entity with differences between
# new and reference
execute \
	if score $init/lobby/update/entity.found_reference fetchr.tmp matches 0 \
	run return fail

data modify storage tmp.fetchr:init/update_lobby new_entity set from entity @s

tag @s add fetchr.handled

data modify storage tmp.fetchr:init/update_lobby entity_data_stack set value []

data modify storage tmp.fetchr:init/update_lobby entity_path_data set value {path:"", index:0}
function fetchr:init/update_lobby/update_entity/update_path {path: ""}

# TODO: update the found old entity if applicable, calculate its location
# and teleport it there