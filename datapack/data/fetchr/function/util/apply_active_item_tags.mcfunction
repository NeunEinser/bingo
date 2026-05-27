#> fetchr:util/apply_active_item_tags
#
# Call this function to apply changes to the active_tags array of storage
# fetchr:items 
#
# @api
# @reads storage fetchr:items active_tags
# @writes storage fetchr:items active_categories
# @writes storage fetchr:items active_items

#>
# @within
# 	function fetchr:util/apply_active_item_tags
# 	function fetchr:util/apply_active_item_tags/**
#declare storage tmp.fetchr:apply_active_item_tags

execute \
	in fetchr:lobby \
	unless loaded 0 0 0 \
	run schedule function fetchr:util/apply_active_item_tags 1t

execute \
	in fetchr:lobby \
	if loaded 0 0 0 \
	as @e[type=minecraft:marker, x=.5,y=0,z=.5, tag=fetchr.string_tester, distance=...1, limit=1] \
	run function fetchr:util/apply_active_item_tags/internal