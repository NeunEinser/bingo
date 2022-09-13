#> bingo:game/on_inventory_changed
#
# This function is called for every player while the game is running
#
# @within advancement bingo:inventory_changed
# @context entity Player

tag @s add bingo.only_check_inventory_once
scoreboard players set @s bingo.inv_change 2

advancement revoke @s only bingo:inventory_changed