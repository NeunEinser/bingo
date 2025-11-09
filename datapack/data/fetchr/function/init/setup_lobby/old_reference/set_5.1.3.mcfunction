#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.1.3
#
# Overrides legacy structure ids with ones for 5.1.3
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.2-pre1

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:credits"}].legacy_id \
	set value "fetchr:old/5.1.3-credits"

data \
	modify storage tmp.fetchr:init/structures structures prepend value {\
		id: "fetchr:machinery",\
		entrance_position: [I; 0, 2, 9],\
		version: 0,\
		legacy_id: "fetchr:old/5.1.3-machinery"\
	} 

execute \
	if entity @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_amber_wat, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1-pre1

execute \
	unless entity @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_amber_wat, limit=1] \
	if entity @e[type=minecraft:marker, tag=fetchr.lobby_sign, nbt={data: {\
		front_text: {\
			messages: [\
				"{\"text\":\"AmberW\",\"bold\":true,\"color\":\"#8eedeb\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @s [\\\"[\\\",{\\\"text\\\":\\\"GitHub/AmberWat\\\",\\\"color\\\":\\\"#4078c0\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://github.com/AmberWat\\\"}},\\\"]\\\"]\"}}",\
				"{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line2\",\"color\":\"#8eedeb\"}",\
				"{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line3\",\"color\":\"#8eedeb\"}",\
				"{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line4\",\"color\":\"#8eedeb\"}"\
			]\
		}\
	}}, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1-pre1

execute \
	unless entity @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_amber_wat] \
	unless entity @e[type=minecraft:marker, tag=fetchr.lobby_sign, nbt={data: {\
		front_text: {\
			messages: [\
				"{\"text\":\"AmberW\",\"bold\":true,\"color\":\"#8eedeb\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @s [\\\"[\\\",{\\\"text\\\":\\\"GitHub/AmberWat\\\",\\\"color\\\":\\\"#4078c0\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://github.com/AmberWat\\\"}},\\\"]\\\"]\"}}",\
				"{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line2\",\"color\":\"#8eedeb\"}",\
				"{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line3\",\"color\":\"#8eedeb\"}",\
				"{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line4\",\"color\":\"#8eedeb\"}"\
			]\
		}\
	}}, limit=1] \
	if entity @e[type=minecraft:marker, tag=fetchr.lobby_sign, nbt={data: {\
		Text1: "{\"text\":\"AmberW\",\"bold\":true,\"color\":\"#8eedeb\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/tellraw @s [\\\"[\\\",{\\\"text\\\":\\\"GitHub/AmberWat\\\",\\\"color\\\":\\\"#4078c0\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"open_url\\\",\\\"value\\\":\\\"https://github.com/AmberWat\\\"}},\\\"]\\\"]\"}}",\
		Text2: "{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line2\",\"color\":\"#8eedeb\"}",\
		Text3: "{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line3\",\"color\":\"#8eedeb\"}",\
		Text4: "{\"translate\":\"fetchr.lobby.credits.amber_wat.sign.line4\",\"color\":\"#8eedeb\"}"\
	}}, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1-pre1