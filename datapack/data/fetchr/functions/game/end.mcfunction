#> fetchr:game/end
#
# Ends the game
#
# @internal

scoreboard players reset * fetchr.lobby
scoreboard players reset $spawn_x fetchr.state
scoreboard players reset $spawn_z fetchr.state

execute if score $game_state fetchr.state matches 3 as @a[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby

execute unless score $game_state fetchr.state matches 3 at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run fill ~-9 ~-2 ~-9 ~10 ~4 ~10 minecraft:black_concrete outline
execute unless score $game_state fetchr.state matches 3 at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run setblock ~ ~-2 ~ minecraft:sea_lantern
execute at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run kill @e[type=!minecraft:player, type=!minecraft:item_frame, tag=!fetchr.skybox_button, distance=..10]
scoreboard players set $pregen_status fetchr.state 0
execute in fetchr:default run forceload remove all
execute in fetchr:default run forceload add 0 0
execute in fetchr:lobby run function neun_einser.timer:stop

execute as @e[type=minecraft:item_frame, tag=fetchr.card_frame] at @s run setblock ~ ~ ~-1 minecraft:barrier
execute in fetchr:lobby run data modify block 5 3 5 auto set value false

scoreboard players add $current_game_id fetchr.game_id 1
scoreboard players set $game_state fetchr.state 0

scoreboard players operation $blind_mode fetchr.state = $blind_mode fetchr.settings
scoreboard players operation $lockout_mode fetchr.state = $lockout_mode fetchr.settings

tag @a remove fetchr.automatically_join_game
tag @s add fetchr.automatically_join_game