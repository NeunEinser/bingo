#> fetchr:game/spawn_preview/teleport_all
#
# Teleport all players to the spawn preview
#
# @internal
# @user

scoreboard players set @s fetchr.operator_check_callback_action 13
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

execute \
	as @a[predicate=fetchr:is_in_lobby] \
	at @e[type=minecraft:marker, tag=fetchr.spawn] \
	run function fetchr:game/spawn_preview/join_game

function #fetchr:spawn_preview/teleported_all_players