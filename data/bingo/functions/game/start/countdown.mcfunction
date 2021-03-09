#> bingo:game/start/countdown
#
# Count down at the start
#
# @within
# 	function bingo:game/start/end_of_skybox
# 	function bingo:game/start/countdown

execute if score $start_game.countdown bingo.tmp matches 1.. run tellraw @a {"score":{"name": "$start_game.countdown", "objective": "bingo.tmp"}}
execute as @a at @s if score $start_game.countdown bingo.tmp matches 1.. run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2

execute if score $start_game.countdown bingo.tmp matches 0 run function bingo:game/start/start_game

scoreboard players remove $start_game.countdown bingo.tmp 1
schedule function bingo:game/start/countdown 1s