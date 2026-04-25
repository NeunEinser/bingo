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

kill @s
$summon $(entity_type) ~ ~ ~ $(entity_nbt)

$execute \
	as @e[type=$(entity_type), distance=...1, tag=fetchr.current_old, limit=1] \
	positioned ~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset) \
	run function #fetchr:lobby_update/manipulate_updated_entity

#NEUN_SCRIPT until 70
#$teleport @e[type=#fetchr:marker_entity, distance=...1, nbt={data:{fetchr:{display_entity_id: "$(entity_id)"}}}] \
	~$(compare_to_clone_x_offset) ~ ~$(compare_to_clone_z_offset)
#NEUN_SCRIPT end