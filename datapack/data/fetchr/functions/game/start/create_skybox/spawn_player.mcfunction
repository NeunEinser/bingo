#> fetchr:game/start/create_skybox/spawn_player
#
# Spawns all players in the skybox
#
# @internal
# @context
# 	entity Current player
# 	position Skybox spawn

execute unless entity @a[predicate=fetchr:is_in_game] in fetchr:lobby at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=0.., limit=1] run clone from fetchr:lobby ~ ~-4 ~-1 ~4 ~ ~-1 to fetchr:default 0 315 0
execute unless entity @a[predicate=fetchr:is_in_game] at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..8, limit=1] run clone 0 315 0 4 319 0 ~ ~-4 ~-1

tellraw @s ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.game.start.loading_terrain"}]
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
# 	function fetchr:game/start/create_skybox/spawn_player
# 	function fetchr:game/start/create_skybox/get_random_team_index
#declare score_holder $game/start/skybox/player.team
function fetchr:game/start/create_skybox/get_random_team_index

execute if score $game/start/skybox/player.team fetchr.tmp matches 0 run team join fetchr.red
execute if score $game/start/skybox/player.team fetchr.tmp matches 1 run team join fetchr.orange
execute if score $game/start/skybox/player.team fetchr.tmp matches 2 run team join fetchr.yellow
execute if score $game/start/skybox/player.team fetchr.tmp matches 3 run team join fetchr.lime
execute if score $game/start/skybox/player.team fetchr.tmp matches 4 run team join fetchr.green
execute if score $game/start/skybox/player.team fetchr.tmp matches 5 run team join fetchr.cyan
execute if score $game/start/skybox/player.team fetchr.tmp matches 6 run team join fetchr.light_blue
execute if score $game/start/skybox/player.team fetchr.tmp matches 7 run team join fetchr.blue
execute if score $game/start/skybox/player.team fetchr.tmp matches 8 run team join fetchr.purple
execute if score $game/start/skybox/player.team fetchr.tmp matches 9 run team join fetchr.magenta

execute in fetchr:lobby run function fetchr:custom_hud/components/timer/update
bossbar set fetchr:start/pre_gen/progress players @a[predicate=fetchr:is_in_game]