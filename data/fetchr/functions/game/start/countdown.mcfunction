#> fetchr:game/start/countdown
#
# Count down at the start
#
# @within
# 	function fetchr:game/start/initialize_countdown
# 	function fetchr:game/start/countdown

execute if score $start_game.countdown fetchr.schedule matches 1.. run tellraw @a[predicate=fetchr:is_in_game] {"score":{"name": "$start_game.countdown", "objective": "fetchr.schedule"}}
execute if score $start_game.countdown fetchr.schedule matches 1.. as @a[predicate=fetchr:is_in_game] at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2

execute if score $start_game.countdown fetchr.schedule matches 0 as @a[predicate=fetchr:is_in_game] run function fetchr:game/start/start_game

scoreboard players remove $start_game.countdown fetchr.schedule 1
execute if score $start_game.countdown fetchr.schedule matches 0.. run schedule function fetchr:game/start/countdown 1s