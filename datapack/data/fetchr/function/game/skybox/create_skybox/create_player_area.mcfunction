#> fetchr:game/skybox/create_skybox/create_player_area
#
# Creates the spawn preview room
#
# @within function fetchr:game/skybox/create_skybox/internal
# @context
# 	entity Spawn marker
# 	position the lowest non-air block with sky access at spawn

setblock ~-1 ~ ~-1 minecraft:structure_block[mode=load]{mode:"LOAD", name:"fetchr:skybox"}
setblock ~-1 ~1 ~-1 minecraft:redstone_block
execute if block ~-1 ~ ~-1 minecraft:structure_block run setblock ~-1 ~ ~-1 minecraft:air
execute if block ~-1 ~1 ~-1 minecraft:redstone_block run setblock ~-1 ~1 ~-1 minecraft:air
execute if score $is_multiplayer fetchr.state matches 1 run setblock ~ ~2 ~9 minecraft:warped_wall_sign[facing=east]{front_text:{messages:['{"translate": "fetchr.skybox.teleport_all.sign.line1","bold":true,"color":"#8eedeb","clickEvent": {"action": "run_command", "value": "function fetchr:game/skybox/teleport_all"}}', '{"translate": "fetchr.skybox.teleport_all.sign.line2","bold":true,"color":"#8eedeb"}', '{"translate": "fetchr.skybox.teleport_all.sign.line3","bold":true,"color":"#8eedeb"}', '{"translate": "fetchr.skybox.teleport_all.sign.line4","bold":true,"color":"#8eedeb"}']}}
execute if score $is_multiplayer fetchr.state matches 1 run setblock ~15 ~2 ~5 minecraft:warped_wall_sign[facing=west]{front_text:{messages:['{"translate": "fetchr.skybox.teleport_all.sign.line1","bold":true,"color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "function fetchr:game/skybox/teleport_all"}}', '{"translate": "fetchr.skybox.teleport_all.sign.line2","bold":true,"color":"#8eedeb"}', '{"translate": "fetchr.skybox.teleport_all.sign.line3","bold":true,"color":"#8eedeb"}', '{"translate": "fetchr.skybox.teleport_all.sign.line4","bold":true,"color":"#8eedeb"}']}}

teleport @s ~7 ~1 ~7
execute as @a[predicate=fetchr:is_in_game] run forceload add ~-1 ~-1 ~1 ~1 
execute as @a[predicate=fetchr:is_in_game] positioned ~7 ~1 ~7 run function fetchr:game/skybox/join_game
execute at @e[type=minecraft:item_frame, tag=fetchr.card_frame, scores={fetchr.lobby_card_frame_id=0}, distance=100.., limit=1] run clone ~ ~-4 ~-1 ~4 ~ ~-1 0 315 0
execute at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..8, limit=1] run clone 0 315 0 4 319 0 ~ ~-4 ~-1 masked
execute positioned ~7 ~1 ~7 as @a[predicate=fetchr:is_in_lobby, tag=fetchr.automatically_join_game] run function fetchr:game/skybox/join_game
fill 0 315 0 4 319 0 minecraft:air

function fetchr:card_frames/spawn
