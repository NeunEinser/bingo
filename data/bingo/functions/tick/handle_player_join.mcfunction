#> bingo:tick/handle_player_join
#
# This function runs for every player who just reconnected.
#
# @within tag/function bingo:player_reconnect
# @handles #bingo:player_reconnect
# @context entity Player who reconnected

# Don't use translation strings here as resource pack is almost never loaded
# here.
execute if score $game_state bingo.state matches 3 run tellraw @s[predicate=bingo:is_in_game] [{"text": "Click here", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}, " to go back to the lobby"]
scoreboard players set @s bingo.update_hud 1
trigger bingo.resources
setblock 1 2 2 minecraft:sea_lantern
execute unless score @s bingo.game_id = $current_game_id bingo.game_id run function bingo:util/go_to_lobby
execute if score $game_state bingo.state matches 0..1 if entity @s[predicate=bingo:is_in_game] run function bingo:util/go_to_lobby

scoreboard players reset @s bingo.reconnect