#> fetchr:game/start/check_dimension_and_start
#
# Called after checking the game is not already running to check if the player
# landed in the correct dimension which is the next mine.
#
# @params
# 	dimension_id: #[id=dimension_type] string The dimension which is the
# 		current one
# 	level_number: int @ 1.. The numeric id of the level
# 	
# @context
# 	entity Player who changed dimension
# 	position The location the player spawned at
# @within function fetchr:game/start/dimension_change

execute \
	if score $game_state fetchr.state matches 4 \
	run return 0

scoreboard players set $start/check_dimension.is_dim fetchr.tmp 0
$execute if dimension $(dimension_id) run scoreboard players set $start/check_dimension.is_dim fetchr.tmp 1
execute if score $start/check_dimension.is_dim fetchr.tmp matches 0 run return 0

$scoreboard players set $level_number fetchr.state $(level_number)

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value []

execute \
	in fetchr:resourcepack_check positioned 0 0 0 \
	as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:game/start/check_special_world

$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "badlands" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "bamboo_jungle" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "beach" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "birch_forest" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "cherry_grove" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "cold_ocean" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "dark_forest" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "desert" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "dripstone_caves" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "forest" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "frozen_ocean" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "frozen_peaks" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "frozen_river" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "grove" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "ice_spikes" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "jungle" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "lukewarm_ocean" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "lush_caves" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "mangrove_swamp" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "meadow" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "mushroom_fields" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "ocean" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "plains" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "river" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "savanna" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "sparse_jungle" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "stony_peaks" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "sunflower_plains" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "swamp" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "taiga" }
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "warm_ocean" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:plains","fetchr:savanna"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "basalt_deltas" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:jungle"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:jungle"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "nether_wastes" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:jungle"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "soul_sand_valley" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:jungle"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "crimson_forest" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:forest","fetchr:jungle"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:swamp","fetchr:forest","fetchr:jungle"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "warped_forest" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "the_end" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna","fetchr:desert","fetchr:badlands"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "end_barrens" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna","fetchr:desert","fetchr:badlands"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "end_midlands" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "end_highlands" }

data modify storage tmp.fetchr:game/start exclude_surface set value ["fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:plains","fetchr:savanna","fetchr:forest","fetchr:desert","fetchr:badlands"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "small_end_islands" }

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:nether_wastes","fetchr:soulsand_valley","fetchr:basalt_deltas","fetchr:crimson_forest","fetchr:warped_forest"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "deep_dark" }

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:nether_wastes","fetchr:soulsand_valley","fetchr:basalt_deltas"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "pale_garden" }

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:crimson_forest","fetchr:warped_forest"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "snowy_beach" }

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:crimson_forest","fetchr:warped_forest"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "snowy_plains" }

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:crimson_forest","fetchr:warped_forest"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "snowy_slopes" }

data modify storage tmp.fetchr:game/start exclude_surface set value []
data modify storage tmp.fetchr:game/start exclude_special set value ["fetchr:crimson_forest","fetchr:warped_forest"]
$function fetchr:game/start/test_biome { level_number: $(level_number), biome: "snowy_taiga" }

function fetchr:game/start/test_structure { biome: "deep_dark", structure: "ancient_city" }
function fetchr:game/start/test_structure { biome: "end_midlands", structure: "end_city" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "end_highlands", structure: "end_city" }
function fetchr:game/start/test_structure { biome: "nether_wastes", structure: "bastion_remnant" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "soul_sand_valley", structure: "bastion_remnant" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "crimson_forest", structure: "bastion_remnant" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "warped_forest", structure: "bastion_remnant" }
function fetchr:game/start/test_structure { biome: "beach", structure: "burried_treasure" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "snowy_beach", structure: "burried_treasure" }
scoreboard players set $start.structure_test fetchr.tmp -1
execute \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:mineshaft
execute \
	if score $start.structure_test fetchr.tmp matches 1.. \
	run data modify storage fetchr:items effects append value "fetchr:mineshaft"
function fetchr:game/start/test_structure { biome: "nether_wastes", structure: "fortress" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "soul_sand_valley", structure: "fortress" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "basalt_deltas", structure: "fortress" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "crimson_forest", structure: "fortress" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "warped_forest", structure: "fortress" }
scoreboard players set $start.structure_test fetchr.tmp -1
execute \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:ruined_portal
execute \
	if score $start.structure_test fetchr.tmp matches 1.. \
	run data modify storage fetchr:items effects append value "fetchr:ruined_portal"
function fetchr:game/start/test_structure { biome: "ocean", structure: "shipwreck" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "ocean", structure: "shipwreck" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "cold_ocean", structure: "shipwreck" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "frozen_ocean", structure: "shipwreck" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "lukewarm_ocean", structure: "shipwreck" }
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	run function fetchr:game/start/test_structure { biome: "warm_ocean", structure: "shipwreck" }
scoreboard players set $start.structure_test fetchr.tmp -1
execute \
	if score $start/biome_test.desert fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:village_desert
execute \
	if score $start.structure_test fetchr.tmp matches ..0 \
	if score $start/biome_test.plains fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:village_plains
execute \
	if score $start.structure_test fetchr.tmp matches -1 \
	if score $start/biome_test.meadow fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:village_plains
execute \
	if score $start.structure_test fetchr.tmp matches ..0 \
	if score $start/biome_test.savanna fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:village_savanna
execute \
	if score $start.structure_test fetchr.tmp matches ..0 \
	if score $start/biome_test.snowy_plains fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:village_snowy
execute \
	if score $start.structure_test fetchr.tmp matches ..0 \
	if score $start/biome_test.taiga fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure minecraft:village_taiga
execute \
	if score $start.structure_test fetchr.tmp matches 1.. \
	run data modify storage fetchr:items effects append value "fetchr:village"

execute \
	in fetchr:resourcepack_check positioned 0 0 0 \
	as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:game/start/set_game_mode

function fetchr:util/apply_active_item_tags
function fetchr:card_frames/spawn_frames
function fetchr:card_generation/random_card
execute positioned ~-3 ~ ~1 run function fetchr:chest_generation/generate_item_chests

scoreboard players set $game_state fetchr.state 4

execute \
	if score $concealed_card fetchr.state matches 1 \
	run schedule function fetchr:game/track_uuid_schedule 5t