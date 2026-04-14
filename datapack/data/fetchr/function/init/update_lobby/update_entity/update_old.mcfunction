#> fetchr:init/update_lobby/update_entity/update_old
#
# Updates the old entity with the updated storage and teleports it to the new
# location in the cloned structure.
#
# @within
# 	function fetchr:init/update_lobby/update_entity/exec
# @params
# 	entity_id: #[id] string,
# 	compare_to_clone_x_offset: int The relative x offset from compare to clone location
# 	compare_to_clone_z_offset: int The relative z offset from compare to clone location

data remove storage tmp.fetchr:init/update_lobby old_entity.UUID
data remove storage tmp.fetchr:init/update_lobby old_entity.Pos
data remove storage tmp.fetchr:init/update_lobby old_entity.Rotation

data \
	modify storage tmp.fetchr:init/update_lobby old_entity.data.fetchr.display_entity_id \
	set from storage tmp.fetchr:init/update_lobby new_entity.data.fetchr.display_entity_id

data modify entity @s {} merge from storage tmp.fetchr:init/update_lobby old_entity
tag @s remove fetchr.current_old

$teleport @s ~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset) ~ ~
$teleport @e[type=#fetchr:marker_entity, distance=...1, nbt={data:{fetchr:{display_entity_id: "$(entity_id)"}}}] \
	~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset)