#> bingo:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function bingo:game/start/countdown

spawnpoint @a ~ ~ ~
tellraw @a {"text": "GO!"}
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1

effect clear @a
clear @a
execute in bingo:lobby run function neun_einser.timer:start/millis 