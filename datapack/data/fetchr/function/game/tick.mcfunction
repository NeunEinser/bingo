#> fetchr:game/tick
#
# This function is called every tick when a game is running
#
# @within function fetchr:tick/tick

execute as @a[predicate=fetchr:is_in_game] at @s run function fetchr:game/player_tick

#>
# Count of players in the game
#
# @private
#declare score_holder $game/tick.player_count
execute store result score $game/tick.player_count fetchr.tmp if entity @a[gamemode=survival, predicate=fetchr:is_in_game]
#>
# Count of players sleeping
#
# @private
#declare score_holder $game/tick.sleeping_players
execute store result score $game/tick.sleeping_players fetchr.tmp if entity @a[gamemode=survival, scores={fetchr.bed=99..}, predicate=fetchr:is_in_game]

execute if score $game/tick.player_count fetchr.tmp matches 1.. if score $game/tick.player_count fetchr.tmp = $game/tick.sleeping_players fetchr.tmp if entity @a[scores={fetchr.bed=99}, limit=1] run function fetchr:game/skip_night

scoreboard players operation $raw 91.timer.io /= $current_percision 91.timer.io
execute in fetchr:resourcepack_check unless score $raw 91.timer.io = $last_tick_second fetchr.state run function fetchr:custom_hud/components/timer/update

scoreboard players reset $update_card fetchr.state

data modify storage tmp.fetchr:game still_active_uuids set value []
data modify storage tmp.fetchr:game uuids set from storage fetchr:track_uuid uuids
execute \
	if score $concealed_card fetchr.state matches 1 \
	run function fetchr:game/check_entities

data modify storage fetchr:track_uuid uuids set from storage tmp.fetchr:game still_active_uuids
execute \
	as @a[tag=fetchr.killed_entity] \
	at @s \
	at @n[type=minecraft:marker, tag=fetchr.dead_entity, distance=..500] \
	run function fetchr:game/spawn_loot
execute \
	at @n[type=minecraft:marker, tag=fetchr.dead_entity] \
	run function fetchr:game/spawn_loot

tag @a remove fetchr.killed_entity