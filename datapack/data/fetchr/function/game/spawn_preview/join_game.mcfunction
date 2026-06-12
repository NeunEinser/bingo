#> fetchr:game/spawn_preview/join_game
#
# Spawns all players in the spawn preview
#
# @internal
# @context
# 	entity Current player
# 	position Spawn preview location

execute \
	unless entity @a[predicate=fetchr:is_in_game] \
	in fetchr:lobby at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=0.., limit=1] \
	run clone from fetchr:lobby ~ ~-4 ~-1 ~4 ~ ~-1 to fetchr:default 0 315 0
execute \
	unless entity @a[predicate=fetchr:is_in_game] \
	run clone 0 315 0 4 319 0 ~-2 ~ ~-8 masked
fill 0 315 0 4 319 0 minecraft:air

#>
# @private
#declare score_holder $spawn_preview/player.x
execute \
	store result score $spawn_preview/player.x fetchr.tmp \
	run data get entity @s Pos[0] 86
#>
# @private
#declare score_holder $spawn_preview/player.z
execute \
	store result score $spawn_preview/player.z fetchr.tmp \
	run data get entity @s Pos[2] 86

#>
# @private
#declare score_holder $spawn_preview/lobby_card.x
execute \
	at @s positioned ~-13 ~ ~-11 \
	store result score $spawn_preview/lobby_card.x fetchr.tmp \
	run data get entity @e[type=minecraft:marker, tag=fetchr.card_frame_start, dx=16, dy=6, dz=12, limit=1] Pos[0] 86
#>
# @private
#declare score_holder $spawn_preview/lobby_card.z
execute \
	at @s positioned ~-13 ~ ~-11 \
	store result score $spawn_preview/lobby_card.z fetchr.tmp \
	run data get \
		entity @e[type=minecraft:marker, tag=fetchr.card_frame_start, dx=16, dy=6, dz=12, limit=1] \
		Pos[2] 86

execute \
	if entity @s[predicate=fetchr:is_in_lobby] \
	run scoreboard players operation $spawn_preview/player.x fetchr.tmp -= $spawn_preview/lobby_card.x fetchr.tmp
execute \
	if entity @s[predicate=fetchr:is_in_lobby] \
	run scoreboard players operation $spawn_preview/player.z fetchr.tmp -= $spawn_preview/lobby_card.z fetchr.tmp
execute \
	if entity @s[predicate=fetchr:is_in_lobby] \
	at @s positioned ~-13 ~ ~-11 \
	unless entity @e[type=minecraft:marker, tag=fetchr.card_frame_start, dx=16, dy=6, dz=12, limit=1] \
	run scoreboard players set $spawn_preview/player.x fetchr.tmp 172
execute \
	if entity @s[predicate=fetchr:is_in_lobby] \
	at @s positioned ~-13 ~ ~-11 \
	unless entity @e[type=minecraft:marker, tag=fetchr.card_frame_start, dx=16, dy=6, dz=12, limit=1] \
	run scoreboard players set $spawn_preview/player.z fetchr.tmp 602
execute \
	if entity @s[predicate=fetchr:is_in_lobby] \
	run scoreboard players add $spawn_preview/player.x fetchr.tmp 473
execute \
	if entity @s[predicate=fetchr:is_in_lobby] \
	run scoreboard players add $spawn_preview/player.z fetchr.tmp 43

execute \
	if entity @s[predicate=fetchr:is_in_game] \
	run scoreboard players operation $spawn_preview/player.x fetchr.tmp %= 1376 fetchr.const
execute \
	if entity @s[predicate=fetchr:is_in_game] \
	run scoreboard players operation $spawn_preview/player.z fetchr.tmp %= 1376 fetchr.const

execute \
	if score $spawn_preview/player.x fetchr.tmp matches ..25 \
	run scoreboard players set $spawn_preview/player.x fetchr.tmp 26
execute \
	if score $spawn_preview/player.z fetchr.tmp matches ..25 \
	run scoreboard players set $spawn_preview/player.z fetchr.tmp 26
execute \
	if score $spawn_preview/player.x fetchr.tmp matches 1351.. \
	run scoreboard players set $spawn_preview/player.x fetchr.tmp 1350
execute \
	if score $spawn_preview/player.z fetchr.tmp matches 1351.. \
	run scoreboard players set $spawn_preview/player.z fetchr.tmp 1350

#>
# @private
#declare score_holder $spawn_preview/spawn.x
scoreboard players operation $spawn_preview/spawn.x fetchr.tmp = $spawn_x fetchr.state
scoreboard players operation $spawn_preview/spawn.x fetchr.tmp *= 86 fetchr.const
#>
# @private
#declare score_holder $spawn_preview/spawn.z
scoreboard players operation $spawn_preview/spawn.z fetchr.tmp = $spawn_z fetchr.state
scoreboard players operation $spawn_preview/spawn.z fetchr.tmp *= 86 fetchr.const

scoreboard players operation $spawn_preview/player.x fetchr.tmp += $spawn_preview/spawn.x fetchr.tmp
scoreboard players operation $spawn_preview/player.z fetchr.tmp += $spawn_preview/spawn.z fetchr.tmp

#>
# @private
#declare tag fetchr.game_start_spawn_preview_pos
summon minecraft:marker ~ ~ ~ { Tags: [ fetchr.game_start_spawn_preview_pos ]}
execute \
	store result \
		entity @e[type=minecraft:marker, tag=fetchr.game_start_spawn_preview_pos, distance=0...1, limit=1] \
		Pos[0] double 0.01162790697674418604651162790698 \
	run scoreboard players get $spawn_preview/player.x fetchr.tmp
execute \
	store result \
		entity @e[type=minecraft:marker, tag=fetchr.game_start_spawn_preview_pos, distance=0..9, limit=1] \
		Pos[2] double 0.01162790697674418604651162790698 \
	run scoreboard players get $spawn_preview/player.z fetchr.tmp

scoreboard players operation @s fetchr.game_id = $current_game_id fetchr.game_id
execute \
	at @e[type=minecraft:marker, tag=fetchr.game_start_spawn_preview_pos, distance=0..13, limit=1] \
	rotated as @s \
	run teleport @s ~ ~ ~
kill @e[type=minecraft:marker, tag=fetchr.game_start_spawn_preview_pos, distance=0..13, limit=1]

tag @s remove fetchr.spectator
tag @s add fetchr.in_spawn_preview

scoreboard players reset @s fetchr.pref
scoreboard players reset @s fetchr.pre_gen_radius
scoreboard players reset @s fetchr.target_time_minutes
scoreboard players enable @s fetchr.lobby

gamemode adventure @s
clear @s
experience set @s 0 levels
experience set @s 0 points

effect give @s minecraft:saturation infinite 255 true
effect give @s minecraft:resistance infinite 255 true
effect give @s minecraft:weakness infinite 255 true

#NEUN_SCRIPT until 49
#attribute @s minecraft:player.entity_interaction_range \
	modifier add fetchr:card_item_frame_range 20 add_value
#NEUN_SCRIPT end
#NEUN_SCRIPT since 49
attribute @s minecraft:entity_interaction_range \
	modifier add fetchr:card_item_frame_range 20 add_value
#NEUN_SCRIPT end

tag @s remove fetchr.has_slot0
tag @s remove fetchr.has_slot1
tag @s remove fetchr.has_slot2
tag @s remove fetchr.has_slot3
tag @s remove fetchr.has_slot4
tag @s remove fetchr.has_slot5
tag @s remove fetchr.has_slot6
tag @s remove fetchr.has_slot7
tag @s remove fetchr.has_slot8
tag @s remove fetchr.has_slot9
tag @s remove fetchr.has_slot10
tag @s remove fetchr.has_slot11
tag @s remove fetchr.has_slot12
tag @s remove fetchr.has_slot13
tag @s remove fetchr.has_slot14
tag @s remove fetchr.has_slot15
tag @s remove fetchr.has_slot16
tag @s remove fetchr.has_slot17
tag @s remove fetchr.has_slot18
tag @s remove fetchr.has_slot19
tag @s remove fetchr.has_slot20
tag @s remove fetchr.has_slot21
tag @s remove fetchr.has_slot22
tag @s remove fetchr.has_slot23
tag @s remove fetchr.has_slot24

scoreboard players set @s fetchr.spyglass_dropped 0
item replace entity @s weapon.offhand \
	with minecraft:spyglass[minecraft:custom_data={ fetchr: { spawn_preview_spyglass: true }}]

#>
# @within
# 	function fetchr:game/spawn_preview/join_game
# 	function fetchr:game/spawn_preview/create/get_random_team_index
#declare score_holder $spawn_preview/player.team
execute \
	store result score $spawn_preview/player.team fetchr.tmp \
	run random value 0..9
execute \
	if entity @s[team=!] \
	run scoreboard players set $spawn_preview/player.team fetchr.tmp -1

execute \
	if score $spawn_preview/player.team fetchr.tmp matches 0 \
	run function fetchr:game/spawn_preview/join_team/red
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 1 \
	run function fetchr:game/spawn_preview/join_team/orange
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 2 \
	run function fetchr:game/spawn_preview/join_team/yellow
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 3 \
	run function fetchr:game/spawn_preview/join_team/lime
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 4 \
	run function fetchr:game/spawn_preview/join_team/green
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 5 \
	run function fetchr:game/spawn_preview/join_team/cyan
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 6 \
	run function fetchr:game/spawn_preview/join_team/light_blue
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 7 \
	run function fetchr:game/spawn_preview/join_team/blue
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 8 \
	run function fetchr:game/spawn_preview/join_team/purple
execute \
	if score $spawn_preview/player.team fetchr.tmp matches 9 \
	run function fetchr:game/spawn_preview/join_team/magenta

execute \
	in fetchr:lobby \
	run function fetchr:custom_hud/components/timer/update
bossbar set fetchr:start/pre_gen/progress players @a[predicate=fetchr:is_in_game]

function #fetchr:spawn_preview/player_entered