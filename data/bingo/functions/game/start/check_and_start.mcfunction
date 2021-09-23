#> bingo:game/start/check_and_start
#
# Check if the game is in a state it can be started in, and if it is, start it.
#
# @within function bingo:lobby/settings/start_game_strict_mode_check

execute unless score $game_state bingo.state matches 0 run tellraw @s {"translate": "bingo.lobby.card_generation.start_game.already_in_progress", "color": "red"}
execute unless score $seed bingo.state matches -2147483648.. run tellraw @s {"translate": "bingo.lobby.card_generation.start_game.no_card", "color": "red"}
execute if score $game_state bingo.state matches 0 if score $seed bingo.state matches -2147483648.. run function bingo:game/start/initialize_game_start