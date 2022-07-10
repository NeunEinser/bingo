#> bingo:game/start/countdown
#
# Count down at the start
#
# @within
# 	function bingo:game/start/initialize_countdown
# 	function bingo:game/start/countdown

execute if score $start_game.countdown bingo.schedule matches 1.. run tellraw @a[predicate=bingo:is_in_game] {"score":{"name": "$start_game.countdown", "objective": "bingo.schedule"}}
execute if score $start_game.countdown bingo.schedule matches 1.. as @a[predicate=bingo:is_in_game] at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 2

execute if score $start_game.countdown bingo.schedule matches 0 as @a[predicate=bingo:is_in_game] run function bingo:game/start/start_game

scoreboard players remove $start_game.countdown bingo.schedule 1
execute if score $start_game.countdown bingo.schedule matches 0.. run schedule function bingo:game/start/countdown 1s