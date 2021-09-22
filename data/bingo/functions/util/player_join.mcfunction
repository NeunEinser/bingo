#> bingo:util/player_join
#
# This function runs for every player who just reconnected.
#
# @within tag/function bingo:player_reconnect
# @handles #bingo:player_reconnect
# @context entity Player who reconnected

execute if score $game_state bingo.state matches 3 run tellraw @s[predicate=!bingo:is_in_lobby] [{"translate": "bingo.game.go_to_lobby", "with": [{"translate": "bingo.game.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}]}]
scoreboard players set @s bingo.update_hud 1
execute if entity @s[predicate=bingo:is_in_overworld] run scoreboard players enable @s bingo.resources

scoreboard players reset @s bingo.reconnect