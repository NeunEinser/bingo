#> fetchr:init/update_lobby/update_structure
#
# Updates the structure
#
# @within fetchr:init/update_lobby/update_structure_callback
# @context dimension fetchr:lobby
# @params
# 	structure_id: #[id=structure] string
# 	compare_z: int @ -30000000..29999999
# 	compare_y: int @ -3..0
# 	old_x: int @ -30000000..29999999
# 	old_y: int @ 0..64
# 	old_z: int @ -30000000..29999999
# 	old_high_x: int @ -30000000..29999999
# 	old_high_y: int @ 0..64
# 	old_high_z: int @ -30000000..29999999
# 	clone_x: int @ -30000000..29999999

#NEUN_SCRIPT until 62
#$place template $(structure_id) -29999999 $(compare_y) $(compare_z)
#$clone \
	$(old_x) $(old_y) $(old_z) \
	$(old_high_x) $(old_high_y) $(old_high_z) \
	$(clone_x) $(old_y) $(old_z) \
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$place template $(structure_id) -29999999 $(compare_y) $(compare_z) none none 1 1 strict
$clone \
	$(old_x) $(old_y) $(old_z) \
	$(old_high_x) $(old_high_y) $(old_high_z) \
	$(clone_x) $(old_y) $(old_z) \
	strict
#NEUN_SCRIPT end