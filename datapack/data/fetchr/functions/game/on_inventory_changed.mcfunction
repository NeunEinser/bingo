#> fetchr:game/on_inventory_changed
#
# This function is called for every player while the game is running
#
# @within advancement fetchr:inventory_changed
# @context entity Player

tag @s add fetchr.only_check_inventory_once
scoreboard players set @s fetchr.inv_change 2

advancement revoke @s only fetchr:inventory_changed