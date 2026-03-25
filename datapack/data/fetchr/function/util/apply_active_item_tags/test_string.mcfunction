#> fetchr:util/apply_active_item_tags/test_negation
#
# Checks if the current value is met
#
# @within
# 	fetchr:util/apply_active_item_tags/test_requirement

data modify entity @s Tags set value []
data modify entity @s Tags append from storage fetchr:items effects[]
data modify entity @s Tags append from storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1]

execute \
	store result score $apply_tags/test_requirement.current_tag_count fetchr.tmp \
	run data get entity @s Tags

data remove storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1]

execute \
	if score $apply_tags/test_requirement.current_tag_count fetchr.tmp = $apply_tags.tag_count fetchr.tmp \
	run return 1

return 0