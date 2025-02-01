#> fetchr:lobby/settings/toggle_show_seed
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the show seed setting.
#
# @user
# @context entity Player changing the setting

execute \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $show_seed fetchr.settings 1
execute \
	if score $show_seed fetchr.settings matches 2 \
	run scoreboard players set $show_seed fetchr.settings 0

execute \
	if score $show_seed fetchr.settings matches 0 \
	run tellraw @s { "translate": "fetchr.lobby.settings.show_seed.toggle.off", "color": "red" }
execute \
	if score $show_seed fetchr.settings matches 1 \
	run tellraw @s { "translate": "fetchr.lobby.settings.show_seed.toggle.on", "color": "green" }

#NEUN_SCRIPT until 65
#execute \
	if score $show_seed fetchr.settings matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, distance=..1, limit=1] \
			data.front_text.messages[3] \
		set value '{ "translate": "fetchr.lobby.settings.show_seed.sign.off", "color": "gray" }'
#execute \
	if score $show_seed fetchr.settings matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, distance=..1, limit=1] \
			data.front_text.messages[3] \
		set value '{ "translate": "fetchr.lobby.settings.show_seed.sign.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $show_seed fetchr.settings matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, distance=..1, limit=1] \
			data.front_text.messages[3] \
		set value { translate: "fetchr.lobby.settings.show_seed.sign.off", color: "gray" }
execute \
	if score $show_seed fetchr.settings matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, distance=..1, limit=1] \
			data.front_text.messages[3] \
		set value { translate: "fetchr.lobby.settings.show_seed.sign.on", color: "green" }
#NEUN_SCRIPT end

function fetchr:lobby/place_indestructible_blocks