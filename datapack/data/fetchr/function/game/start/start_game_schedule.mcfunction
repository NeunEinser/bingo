#> fetchr:game/start/start_game_schedule_schedule
#
# Triggers whenever a player changes dimension from the overworld to somewhere
# else.
#
# This is used as a trigger to control building the item pool for the specific
# mine and to generate a card
#
# @context
# 	entity Player who changed dimension
# 	position The location the player spawned at
# @within advancement fetchr:change_dimension

title @a actionbar {translate:"fetchr.generating_card.waiting_for_terrain"}

execute \
	at @a[predicate=fetchr:is_in_game, limit=1] \
	at @e[tag=fetchr.spawn, distance=..10, limit=1] \
	unless loaded ~32 ~ ~ \
	unless loaded ~-32 ~ ~ \
	unless loaded ~ ~ ~32 \
	unless loaded ~ ~ ~-32 \
	run return run schedule function fetchr:game/start/start_game_schedule 5t

title @a actionbar {translate:"fetchr.generating_card.generating"}

schedule function fetchr:game/start/start_game 1t