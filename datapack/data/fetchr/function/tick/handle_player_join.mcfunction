#> fetchr:tick/handle_player_join
#
# This function runs for every player who just reconnected.
#
# @within tag/function fetchr:player_reconnect
# @handles #fetchr:player_reconnect
# @context entity Player who reconnected

function fetchr:util/find_player_team

execute if score $game_state fetchr.state matches 4 as @s[predicate=fetchr:is_in_game] run function fetchr:game/menu/print_with_hint

scoreboard players set @s fetchr.update_hud 1
trigger fetchr.resource_pack_check
setblock 1 2 2 minecraft:sea_lantern
execute unless score @s fetchr.game_id = $current_game_id fetchr.game_id if entity @s[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby
execute if score $game_state fetchr.state matches ..1 if entity @s[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby

#>
# @private
#declare score_holder $player_join.item_count
execute store result score $player_join.item_count fetchr.tmp run data get storage fetchr:card teams[-1].item_count

execute if score $player_join.item_count fetchr.tmp matches 25 run tag @s add fetchr.spectator

scoreboard players reset @s fetchr.reconnect

execute if entity @s[predicate=fetchr:is_in_lobby] run schedule function fetchr:lobby/place_indestructible_blocks 1t replace