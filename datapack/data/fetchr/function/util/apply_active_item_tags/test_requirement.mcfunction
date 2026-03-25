#> fetchr:util/apply_active_item_tags/test_requirement
#
# Checks if the current requirement is met
#
# @within
# 	fetchr:util/apply_active_item_tags/find_next_category
# 	fetchr:util/apply_active_item_tags/test_disjunction
# 	fetchr:util/apply_active_item_tags/test_conjunction
# 	fetchr:util/apply_active_item_tags/test_negation

# execute \
# 	unless data storage tmp.fetchr:apply_active_item_tags current_requirement_stack[0] \
# 	run return 1

execute \
	if data storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1][0] \
	run return run function fetchr:util/apply_active_item_tags/test_disjunction

data \
	modify storage tmp.fetchr:apply_active_item_tags current_requirement \
	set from storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1]
execute \
	if data storage tmp.fetchr:apply_active_item_tags current_requirement.type \
	run data \
		modify storage tmp.fetchr:apply_active_item_tags current_requirement_stack[-1] \
		set from storage tmp.fetchr:apply_active_item_tags current_requirement.value

execute \
	if data storage tmp.fetchr:apply_active_item_tags current_requirement{type: "disjunction"} \
	run return run function fetchr:util/apply_active_item_tags/test_disjunction
execute \
	if data storage tmp.fetchr:apply_active_item_tags current_requirement{type: "conjunction"} \
	run return run function fetchr:util/apply_active_item_tags/test_conjunction
execute \
	if data storage tmp.fetchr:apply_active_item_tags current_requirement{type: "negation"} \
	run return run function fetchr:util/apply_active_item_tags/test_negation
return run function fetchr:util/apply_active_item_tags/test_string