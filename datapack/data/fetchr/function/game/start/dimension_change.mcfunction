#> fetchr:game/start/dimension_change
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

advancement revoke @s only fetchr:enter_mine
kill @e[tag=fetchr.spawn]
execute \
	positioned ~ ~.5 ~ \
	align xyz \
	run summon minecraft:marker ~.5 ~ ~.5 {Tags: ["fetchr.spawn"]}

title @a actionbar {translate:"fetchr.generating_card.waiting_for_terrain"}

schedule function fetchr:game/start/start_game_schedule 20t