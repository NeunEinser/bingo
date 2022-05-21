#> bingo:tick/handle_player_join
#
# This function runs for every player who just reconnected.
#
# @within tag/function bingo:player_reconnect
# @handles #bingo:player_reconnect
# @context entity Player who reconnected

function bingo:util/find_player_team

# Resource pack is likely not loaded here. In case it isn't, just print
# hardcoded English message.
execute if score $game_state bingo.state matches 3 run tellraw @s[predicate=bingo:is_in_game] {"translate": "%1074992263$s%1$s", "with": [["", {"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, " to go back to the lobby\n", {"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}, " to switch to spectator mode."], [{"translate": "bingo.game.menu.options", "with": [{"translate": "bingo.game.menu.options.click_lobby", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, {"translate": "bingo.game.menu.options.click_spectator", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.spectator"}}]}]]}
execute if score $game_state bingo.state matches 3 run tellraw @s[predicate=bingo:is_in_game] {"translate": "%1074992263$s%1$s", "with": [["", {"text": "Hint: You can click ", "color": "gray", "italic": true}, {"text":"[", "color":"white"}, {"text":"≡", "color":"#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.menu"}, "hoverEvent":{"action":"show_text","contents":["Bingo Menu"]}}, {"text":"]", "color":"white"}, {"text": " or use the command ", "color": "gray", "italic": true}, {"text": "/trigger bingo.menu", "color": "white", "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.menu"}}, {"text":" at any time to bring up the bingo menu.", "color":"gray", "italic":true}], [{"translate": "bingo.game.menu.hint", "color": "gray", "italic": true, "with": [{"translate": "bingo.game.menu.text", "color": "white", "italic": false, "with": [{"translate": "bingo.game.menu.icon", "color": "#00c3ff", "italic": false, "clickEvent": {"action": "run_command", "value": "/trigger bingo.menu"}, "hoverEvent":{"action":"show_text","contents":[{"translate":"bingo.game.menu.hover_text"}]}}]}, {"text": "/trigger bingo.menu", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.menu"}}]}]]}

scoreboard players set @s bingo.update_hud 1
trigger bingo.resources
setblock 1 2 2 minecraft:sea_lantern
execute unless score @s bingo.game_id = $current_game_id bingo.game_id if entity @s[predicate=bingo:is_in_game] run function bingo:util/go_to_lobby
execute if score $game_state bingo.state matches 0..1 if entity @s[predicate=bingo:is_in_game] run function bingo:util/go_to_lobby

#>
# @private
#declare score_holder $player_join.item_count
execute store result score $player_join.item_count bingo.tmp run data get storage bingo:card teams[-1].itemCount

execute if score $player_join.item_count bingo.tmp matches 25 run tag @s add bingo.spectator


scoreboard players reset @s bingo.reconnect