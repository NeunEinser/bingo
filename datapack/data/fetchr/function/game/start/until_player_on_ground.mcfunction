#> fetchr:game/start/until_player_on_ground
#
# Wait for player hitting ground
#
# @within
# 	function fetchr:game/start/start_falling
# 	function fetchr:game/start/until_player_on_ground

execute \
	unless entity @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt=!{ OnGround: true }, limit=1] \
	at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] \
	positioned over motion_blocking_no_leaves \
	unless block ~ ~ ~ #minecraft:leaves \
	unless block ~ ~1 ~ #minecraft:leaves \
	run function fetchr:game/start/initialize_countdown
execute \
	unless entity @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt=!{ OnGround: true }, limit=1] \
	at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] \
	positioned over motion_blocking_no_leaves \
	if block ~ ~ ~ #minecraft:leaves \
	positioned over motion_blocking \
	run function fetchr:game/start/initialize_countdown
execute \
	unless entity @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt=!{ OnGround: true }, limit=1] \
	at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] \
	positioned over motion_blocking_no_leaves \
	unless block ~ ~ ~ #minecraft:leaves \
	if block ~ ~1 ~ #minecraft:leaves \
	positioned over motion_blocking \
	run function fetchr:game/start/initialize_countdown


execute \
	if entity @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt=!{ OnGround: true }, limit=1] \
	run schedule function fetchr:game/start/until_player_on_ground 1t