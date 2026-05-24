#> fetchr:lobby/settings/set_pre_gen_radius_internal
#
# Sets the pre-generation to the value in the trigger objective of the current
# player
#
# @context
# 	entity The player who wants to set the pre-generation radius.
# @input
# 	score @s fetchr.pre_gen_radius The radius to set the pre-generation to.

execute \
	if score @s fetchr.pre_gen_radius matches ..143 \
	run tellraw @s {\
		"translate": "fetchr.settings.pre_gen.error.too_low",\
		"color": "red",\
		"with": [\
			{ "score": { "name": "@s", "objective": "fetchr.pre_gen_radius" }},\
			"144"\
		]\
	}
execute \
	if score @s fetchr.pre_gen_radius matches ..143 \
	run return 0

scoreboard players operation $pregeneration_radius fetchr.setting_values = @s fetchr.pre_gen_radius
scoreboard players operation $pregeneration_chunks fetchr.setting_values = $pregeneration_radius fetchr.setting_values
scoreboard players operation $pregeneration_chunks fetchr.setting_values /= 16 fetchr.const
scoreboard players operation $pregeneration_chunks fetchr.setting_values += $pregeneration_chunks fetchr.setting_values
scoreboard players add $pregeneration_chunks fetchr.setting_values 1
scoreboard players operation $pregeneration_chunks fetchr.setting_values *= $pregeneration_chunks fetchr.setting_values
#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages[0] set value '{\
	"translate": "fetchr.settings.pre_gen.value.radius",\
	"color": "green",\
	"with": [{ "score": { "name": "$pregeneration_radius", "objective": "fetchr.setting_values" }}]\
}'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.pre_gen.value.radius",\
	color: "green",\
	with: [{ score: { name: "$pregeneration_radius", objective: "fetchr.setting_values" }}]\
}
#NEUN_SCRIPT end

execute \
	if score @s fetchr.pre_gen_radius matches 144 \
	run tellraw @s { "translate": "fetchr.settings.pre_gen.confirmation.set_minimal", "color": "green" }
execute \
	if score @s fetchr.pre_gen_radius matches 145.. \
	run tellraw @s {\
		"translate": "fetchr.settings.pre_gen.confirmation.set_radius",\
		"color": "green",\
		"with": [{ "score": { "name": "@s", "objective": "fetchr.pre_gen_radius" }}]\
	}

#NEUN_SCRIPT until 69
#execute \
	if score @s fetchr.pre_gen_radius matches 144 \
	run data \
		modify storage fetchr:settings pre_gen_radius \
		set value '{ "translate": "fetchr.settings.pre_gen.value.minimal", "color": "gray" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score @s fetchr.pre_gen_radius matches 144 \
	run data \
		modify storage fetchr:settings pre_gen_radius \
		set value { translate: "fetchr.settings.pre_gen.value.minimal", color: "gray" }
#NEUN_SCRIPT end
execute \
	if score @s fetchr.pre_gen_radius matches 145.. \
	run data \
		modify storage fetchr:settings pre_gen_radius \
		set from block 7 0 7 front_text.messages[0]

scoreboard players operation @s fetchr.settings = @s fetchr.setting_callback
scoreboard players reset @s fetchr.setting_callback
scoreboard players reset @s fetchr.pre_gen_radius