#> bingo:game/player_tick
#
# This function is called for every player while the game is running
#
# @within function bingo:game/tick
# @context entity Player

scoreboard players enable @s bingo.menu
execute if entity @s[scores={bingo.menu=1}] run function bingo:game/bingo_menu/print_without_hint
scoreboard players reset @s[scores={bingo.menu=1}] bingo.menu

scoreboard players enable @s[tag=!bingo.spectator] bingo.spectator
execute if score $game_state bingo.state matches 3 if entity @s[tag=bingo.enable_manual_gamemode_switch, gamemode=!survival] run tag @s add bingo.spectator
execute unless score $game_state bingo.state matches 3 if entity @s[tag=bingo.enable_manual_gamemode_switch, gamemode=!adventure] run tag @s add bingo.spectator

execute if score $game_state bingo.state matches 3 run tellraw @s[tag=!bingo.spectator, gamemode=!survival] [{"translate": "bingo.game.switch_gamemode.prevented", "with": [{"translate": "bingo.game.switch_gamemode.prevented.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}]}, "\n\n",{"translate": "bingo.game.switch_gamemode.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.spectator", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.spectator"}}]}]
execute if score $game_state bingo.state matches 3 run gamemode survival @s[tag=!bingo.spectator, gamemode=!survival]
execute unless score $game_state bingo.state matches 3 run tellraw @s[tag=!bingo.spectator, gamemode=!adventure] [{"translate": "bingo.game.switch_gamemode.prevented", "with": [{"translate": "bingo.game.switch_gamemode.prevented.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}]}, "\n\n",{"translate": "bingo.game.switch_gamemode.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.spectator", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.spectator"}}]}]
execute unless score $game_state bingo.state matches 3 run gamemode adventure @s[tag=!bingo.spectator, gamemode=!adventure]

tag @s[scores={bingo.spectator=1}] add bingo.spectator
# Gamemode creative to make F3+F4 switch to creative
gamemode creative @s[scores={bingo.spectator=1}]
gamemode spectator @s[scores={bingo.spectator=1}]
scoreboard players reset @s[scores={bingo.spectator=1}] bingo.spectator

# Set player inventory change delay
scoreboard players remove @s[scores={bingo.inv_change=1..}] bingo.inv_change 1

execute if score @s bingo.chest matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.barrel matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.enderchest matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.shulkerbox matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.crafting matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.furnace matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.b_furnace matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.smoker matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.grindstone matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.stonecut matches 1.. run scoreboard players set @s bingo.inv_change 20
execute if score @s bingo.brewing matches 1.. run scoreboard players set @s bingo.inv_change 20

scoreboard players reset @s bingo.chest
scoreboard players reset @s bingo.barrel
scoreboard players reset @s bingo.enderchest
scoreboard players reset @s bingo.shulkerbox
scoreboard players reset @s bingo.crafting
scoreboard players reset @s bingo.furnace
scoreboard players reset @s bingo.b_furnace
scoreboard players reset @s bingo.smoker
scoreboard players reset @s bingo.grindstone
scoreboard players reset @s bingo.stonecut
scoreboard players reset @s bingo.brewing

tag @s[tag=bingo.position_changed] remove bingo.check_inventory
tag @s[tag=bingo.only_check_inventory_once] remove bingo.check_inventory
tag @s[scores={bingo.inv_change=1..}] add bingo.check_inventory
tag @s[scores={bingo.inv_change=2..}] remove bingo.only_check_inventory_once

# This should always be at the end to prevent game logic from running for this
# player in the lobby.
scoreboard players enable @s bingo.lobby
execute if entity @s[scores={bingo.lobby=1}] run function bingo:util/go_to_lobby