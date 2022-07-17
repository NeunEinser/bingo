#> fetchr:game/start/spawn_players
#
# Spawns all players in the skybox
#
# @within function fetchr:game/start/spawn_skybox
# @context entity Current player

tellraw @s ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.game.start.loading_terrain"}]
scoreboard players operation @s fetchr.game_id = $current_game_id fetchr.game_id
teleport @s ~ 128 ~
tag @s remove fetchr.spectator

scoreboard players reset @s fetchr.pref
scoreboard players reset @s fetchr.seed
scoreboard players reset @s fetchr.settings

gamemode adventure @s
effect give @s minecraft:jump_boost 1000000 128 true
effect give @s minecraft:invisibility 1000000 0 true
effect give @s minecraft:saturation 1000000 255 true
effect give @s minecraft:weakness 1000000 255 true
clear @s
experience set @s 0 levels
experience set @s 0 points

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