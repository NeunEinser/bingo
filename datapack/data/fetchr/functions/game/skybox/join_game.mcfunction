#> fetchr:game/skybox/join_game
#
# Spawns all players in the skybox
#
# @internal
# @context
# 	entity Current player
# 	position Skybox spawn

execute unless entity @a[predicate=fetchr:is_in_game] in fetchr:lobby at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=0.., limit=1] run clone from fetchr:lobby ~ ~-4 ~-1 ~4 ~ ~-1 to fetchr:default 0 315 0
execute unless entity @a[predicate=fetchr:is_in_game] at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..8, limit=1] run clone 0 315 0 4 319 0 ~ ~-4 ~-1

scoreboard players operation @s fetchr.game_id = $current_game_id fetchr.game_id
teleport @s ~ ~ ~
tag @s remove fetchr.spectator
tag @s add fetchr.in_skybox

scoreboard players reset @s fetchr.pref
scoreboard players reset @s fetchr.seed
scoreboard players reset @s fetchr.settings
scoreboard players enable @s fetchr.lobby

gamemode adventure @s
clear @s
experience set @s 0 levels
experience set @s 0 points

effect give @s minecraft:saturation infinite 255 true
effect give @s minecraft:resistance infinite 255 true
effect give @s minecraft:weakness infinite 255 true

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

#>
# @within
# 	function fetchr:game/skybox/join_game
# 	function fetchr:game/skybox/create_skybox/get_random_team_index
#declare score_holder $game/start/skybox/player.team
function fetchr:game/skybox/create_skybox/get_random_team_index

execute if score $game/start/skybox/player.team fetchr.tmp matches 0 run function fetchr:game/skybox/join_team/red
execute if score $game/start/skybox/player.team fetchr.tmp matches 1 run function fetchr:game/skybox/join_team/orange
execute if score $game/start/skybox/player.team fetchr.tmp matches 2 run function fetchr:game/skybox/join_team/yellow
execute if score $game/start/skybox/player.team fetchr.tmp matches 3 run function fetchr:game/skybox/join_team/lime
execute if score $game/start/skybox/player.team fetchr.tmp matches 4 run function fetchr:game/skybox/join_team/green
execute if score $game/start/skybox/player.team fetchr.tmp matches 5 run function fetchr:game/skybox/join_team/cyan
execute if score $game/start/skybox/player.team fetchr.tmp matches 6 run function fetchr:game/skybox/join_team/light_blue
execute if score $game/start/skybox/player.team fetchr.tmp matches 7 run function fetchr:game/skybox/join_team/blue
execute if score $game/start/skybox/player.team fetchr.tmp matches 8 run function fetchr:game/skybox/join_team/purple
execute if score $game/start/skybox/player.team fetchr.tmp matches 9 run function fetchr:game/skybox/join_team/magenta

execute in fetchr:lobby run function fetchr:custom_hud/components/timer/update
bossbar set fetchr:start/pre_gen/progress players @a[predicate=fetchr:is_in_game]