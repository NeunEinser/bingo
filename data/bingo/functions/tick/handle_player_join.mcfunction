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
execute if score $game_state bingo.state matches 3 as @s[predicate=bingo:is_in_game] run function bingo:game/bingo_menu/print_with_hint

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

execute if entity @s[predicate=bingo:is_in_lobby] run schedule function bingo:lobby/place_indestructible_blocks 1t replace