#> fetchr:util/apply_active_item_tags/test_conjunction
#
# Checks if the current conjunction is met
#
# @within
# 	fetchr:util/apply_active_item_tags/test_requirement
# 	fetchr:util/apply_active_item_tags/test_conjunction

data \
	modify storage tmp.fetchr:apply_active_item_tags current_requirement_stack \
	append from storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1][-1]

execute \
	store result score $apply_active_item_tags/test_requirement.success fetchr.tmp \
	run function fetchr:util/apply_active_item_tags/test_requirement

execute \
	if score $apply_active_item_tags/test_requirement.success fetchr.tmp matches 0 \
	run data remove storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1]
execute \
	if score $apply_active_item_tags/test_requirement.success fetchr.tmp matches 0 \
	run return 0

data remove storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1][-1]
scoreboard players set $apply_active_item_tags/test_requirement.end fetchr.tmp 0
execute \
	unless data storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1][-1] \
	run scoreboard players set $apply_active_item_tags/test_requirement.end fetchr.tmp 1
execute \
	unless score $apply_active_item_tags/test_requirement.end fetchr.tmp matches 0 \
	run data remove storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1]
execute \
	unless score $apply_active_item_tags/test_requirement.end fetchr.tmp matches 0 \
	run return 1

return run function fetchr:util/apply_active_item_tags/test_conjunction