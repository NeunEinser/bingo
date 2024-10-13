#> fetchr:util/apply_active_item_tags/calculate_global_weight
#
# This calculates the global weight and adds the item.
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/calculate_global_weight
# @reads storage fetchr:items active_items

#>
# @private
#declare score_holder $apply_tags/global_weight.denom
$execute \
	store result score $apply_tags/global_weight.denom fetchr.tmp run \
	data get storage fetchr:items active_items[$(i)].weight_denom

#>
# @private
#declare score_holder $apply_tags/global_weight.nom
$execute \
	store result score $apply_tags/global_weight.nom fetchr.tmp \
	run data get storage fetchr:items active_items[$(i)].weight_nom


scoreboard players operation $apply_tags/global_weight.nom fetchr.tmp *= $available_category_weight fetchr.state

$execute \
	store result storage fetchr:items active_items[$(i)].weight int 1 \
	run scoreboard players operation $apply_tags/global_weight.nom fetchr.tmp /= $apply_tags/global_weight.denom fetchr.tmp

scoreboard players operation $total_item_weight fetchr.state \
	+= $apply_tags/global_weight.nom fetchr.tmp

execute \
	store result storage tmp.fetchr:apply_active_item_tags iterate.i int 1 \
	run scoreboard players add $apply_tags.i fetchr.tmp 1

$execute \
	if data storage fetchr:items active_items[$(i)] \
	run function fetchr:util/apply_active_item_tags/calculate_global_weight \
		with storage tmp.fetchr:apply_active_item_tags iterate