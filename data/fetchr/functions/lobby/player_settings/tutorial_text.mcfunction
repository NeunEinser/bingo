tellraw @a[scores={fetchr.tmp=1}] {"translate": "fetchr.lobby.settings.player.tutorial.part1"}
tellraw @a[scores={fetchr.tmp=2}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part2"}]
tellraw @a[scores={fetchr.tmp=3}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part3"}]
tellraw @a[scores={fetchr.tmp=4}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part4"}]
tellraw @a[scores={fetchr.tmp=5}] ["\n", {"translate": "fetchr.lobby.settings.player.tutorial.part5"}]
scoreboard players reset @a[scores={fetchr.tmp=5}] fetchr.tmp

scoreboard players add @a[scores={fetchr.tmp=1..}] fetchr.tmp 1

execute if entity @a[scores={fetchr.tmp=1..}, limit=1] run schedule function fetchr:lobby/player_settings/tutorial_text 7s