#> fetchr:lobby/settings/join_game
#
# This function prints the prompt for changing pregen behavior.
#
# @user
# @context entity Player changing the setting

execute unless score $seed fetchr.state matches -2147483648.. run tellraw @s {"translate": "fetchr.lobby.card_generation.join_game.no_card", "color": "red"}
execute if score $seed fetchr.state matches -2147483648.. if score $game_state fetchr.state matches ..1 run tellraw @s {"translate": "fetchr.lobby.card_generation.join_game.error.not_ready", "color": "red"}
execute if score $game_state fetchr.state matches 3 run tellraw @s {"translate": "fetchr.lobby.card_generation.join_game.error.in_progress", "color": "red"}

execute if score $game_state fetchr.state matches 2 at @e[tag=fetchr.spawn] run function fetchr:game/start/create_skybox/spawn_player