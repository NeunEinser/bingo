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
# @params
# 	compare_to_clone_x_offset: int The relative x offset from compare to clone location
# 	compare_to_clone_z_offset: int The relative z offset from compare to clone location

execute \
	if entity @s[type=#fetchr:marker_entity] \
	if data entity @s data.fetchr.display_entity_id \
	run return 0

$execute \
	if entity @s[type=#fetchr:marker_entity] \
	run return run teleport @s ~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset)

# Get display entity id and return if missing
data remove storage tmp.fetchr:init/update_lobby update_coordinates.entity_id
data \
	modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_id \
	set from entity @s data.fetchr.display_entity_id

execute \
	unless data entity @s data.fetchr.display_entity_id \
	as @n[type=#fetchr:marker_entity, distance=...1] \
	run data \
		modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_id \
		set from entity @s data.fetchr.display_entity_id

$execute \
	unless data storage tmp.fetchr:init/update_lobby update_coordinates.entity_id \
	run return run teleport @s ~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset)

# Get entity type id and find reference
summon minecraft:text_display ~ ~ ~ {Tags: ["fetchr.vehicle"]}
ride @s mount @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1]
data \
	modify storage tmp.fetchr:init/update_lobby update_coordinates.entity_type \
	set from entity @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1] Passengers[0].id
kill @e[type=minecraft:text_display, tag=fetchr.vehicle, distance=...1, limit=1]

function fetchr:init/update_lobby/update_entity/find_corresponding_in_reference \
	with storage tmp.fetchr:init/update_lobby update_coordinates

# If reference and old is found, update old entity with differences between
# new and reference
$execute \
	if score $init/lobby/update/entity.found_reference fetchr.tmp matches 0 \
	run return run teleport @s ~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset)

data modify storage tmp.fetchr:init/update_lobby new_entity set from entity @s
data modify storage tmp.fetchr:init/update_lobby entity_data_stack set value []

data modify storage tmp.fetchr:init/update_lobby entity_path_data set value {path:"", index:0}
function fetchr:init/update_lobby/update_entity/update_path {path: ""}

execute \
	as @e[tag=fetchr.current_old] \
	run function fetchr:init/update_lobby/update_entity/update_old \
		with storage tmp.fetchr:init/update_lobby update_coordinates