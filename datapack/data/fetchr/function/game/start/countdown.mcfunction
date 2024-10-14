#> fetchr:game/start/countdown
#
# Count down at the start
#
# @within
# 	function fetchr:game/start/initialize_countdown
# 	function fetchr:game/start/countdown

teleport @e[type=!#fetchr:keep_on_game_start, tag=!fetchr.generated_entity, distance=..10000] ~ -128 ~
kill @e[y=-128, distance=..1]

execute if score $start_game.countdown fetchr.tmp matches 1.. run tellraw @a[predicate=fetchr:is_in_game] {"score":{"name": "$start_game.countdown", "objective": "fetchr.tmp"}}
execute if score $start_game.countdown fetchr.tmp matches 1.. as @a[predicate=fetchr:is_in_game] at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2

execute if score $start_game.countdown fetchr.tmp matches 0 at @e[type=minecraft:marker, tag=fetchr.spawn] positioned over motion_blocking_no_leaves run function fetchr:game/start/start_game with storage fetchr:card random_sequence_data

scoreboard players remove $start_game.countdown fetchr.tmp 1
execute if score $start_game.countdown fetchr.tmp matches 0.. run schedule function fetchr:game/start/countdown 1s
