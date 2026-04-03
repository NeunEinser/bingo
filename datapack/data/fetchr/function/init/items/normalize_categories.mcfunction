
$execute unless data storage fetchr:items categories[$(i)] run return 0
$execute \
	unless data storage fetchr:items categories[$(i)].weight \
	run data modify storage fetchr:items categories[$(i)].weight set value 1

$execute \
	unless data storage fetchr:items categories[$(i)].category_weight \
	run data \
		modify storage fetchr:items categories[$(i)].category_weight \
		set from storage fetchr:items categories[$(i)].weight

$data remove storage fetchr:items categories[$(i)].weight

scoreboard players add $init/items/categories.i fetchr.tmp 1
execute \
	store result storage tmp.fetchr:init category_data.i int 1 \
	run scoreboard players get $init/items/categories.i fetchr.tmp

function fetchr:init/items/normalize_categories with storage tmp.fetchr:init category_data