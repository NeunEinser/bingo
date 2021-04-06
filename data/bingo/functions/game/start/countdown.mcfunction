#> bingo:game/start/countdown
#
# Count down at the start
#
# @within
# 	function bingo:game/start/end_of_skybox
# 	function bingo:game/start/countdown

#>
# @private
#declare score_holder $countdown

scoreboard players set $countdown bingo.debug_scdl 0

execute if score $start_game.countdown bingo.tmp matches 3 at @a[predicate=!bingo:is_in_lobby, limit=1] align xz positioned ~0.5 ~ ~0.5 run function bingo:game/start/set_spawn

execute if score $start_game.countdown bingo.tmp matches 1.. run tellraw @a {"score":{"name": "$start_game.countdown", "objective": "bingo.tmp"}}
execute if score $start_game.countdown bingo.tmp matches 1.. as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2

execute if score $start_game.countdown bingo.tmp matches 0 as @a[predicate=!bingo:is_in_lobby] run function bingo:game/start/start_game

scoreboard players remove $start_game.countdown bingo.tmp 1
execute if score $start_game.countdown bingo.tmp matches 0.. run schedule function bingo:game/start/countdown 1s
tellraw @a "[DEBUG] Scheduled function"

scoreboard players set $countdown bingo.debug_scdl 1