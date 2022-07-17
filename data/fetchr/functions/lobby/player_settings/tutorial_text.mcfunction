tellraw @a[scores={fetchr.schedule=1}] {"translate": "fetchr.lobby.settings.player.tutorial.part1"}
tellraw @a[scores={fetchr.schedule=2}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part2"}]
tellraw @a[scores={fetchr.schedule=3}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part3"}]
tellraw @a[scores={fetchr.schedule=4}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part4"}]
tellraw @a[scores={fetchr.schedule=5}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part5"}]
scoreboard players reset @a[scores={fetchr.schedule=5}] fetchr.schedule

scoreboard players add @a[scores={fetchr.schedule=1..}] fetchr.schedule 1

execute if entity @a[scores={fetchr.schedule=1..}, limit=1] run schedule function fetchr:lobby/player_settings/tutorial_text 7s