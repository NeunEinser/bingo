#> bingo:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function bingo:game/start/countdown

execute as @a at @s run spawnpoint @s ~ ~ ~
tellraw @a {"text": "GO!"}
tellraw @a [{"translate": "bingo.game.go_to_lobby", "with": [{"translate": "bingo.game.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}]}, "\n", {"translate": "bingo.game.go_to_lobby.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.lobby", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.lobby"}}]}]
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1

effect clear @a
clear @a
gamerule doDaylightCycle true
advancement revoke @a from bingo:item_detection/root
execute in bingo:lobby run function neun_einser.timer:start/hundredth_of_second