tellraw @a[scores={bingo.schedule=1}] {"translate": "bingo.lobby.settings.player.tutorial.part1"}
tellraw @a[scores={bingo.schedule=2}] ["\n", {"translate": "bingo.lobby.settings.player.tutorial.part2"}]
tellraw @a[scores={bingo.schedule=3}] ["\n", {"translate": "bingo.lobby.settings.player.tutorial.part3"}]
tellraw @a[scores={bingo.schedule=4}] ["\n", {"translate": "bingo.lobby.settings.player.tutorial.part4"}]
tellraw @a[scores={bingo.schedule=5}] ["\n", {"translate": "bingo.lobby.settings.player.tutorial.part5"}]
scoreboard players reset @a[scores={bingo.schedule=5}] bingo.schedule

scoreboard players add @a[scores={bingo.schedule=1..}] bingo.schedule 1

execute if entity @a[scores={bingo.schedule=1..}, limit=1] run schedule function bingo:lobby/player_settings/tutorial_text 7s