#> fetchr:util/apply_active_item_tags/test_negation
#
# Checks if the current negation is met
#
# @within
# 	fetchr:util/apply_active_item_tags/test_requirement

execute \
	store result score $apply_active_item_tags/test_requirement.success fetchr.tmp \
	run function fetchr:util/apply_active_item_tags/test_requirement

execute \
	if score $apply_active_item_tags/test_requirement.success fetchr.tmp matches 0 \
	run return 1

return 0