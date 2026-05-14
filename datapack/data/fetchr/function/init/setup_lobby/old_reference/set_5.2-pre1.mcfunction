#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.2-pre1
#
# Overrides legacy structure ids with ones for 5.2-pre1
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.2-pre4

data \
	modify storage io.fetchr:structures structures[{id: "fetchr:card_generation"}].legacy_id \
	set value "fetchr:old/5.2-pre1-card_generation"

execute \
	if entity @e[type=minecraft:marker, tag=fetchr.lobby_sign, nbt={data: {\
		front_text: {\
			messages: [\
				'{"translate":"fetchr.lobby.machinery.sign.line1", "bold":true, "color":"#8eedeb"}',\
				'{"translate": "fetchr.lobby.machinery.sign.line2", "color":"#8eedeb"}',\
				'{"translate": "fetchr.lobby.machinery.sign.line3", "color":"#8eedeb"}',\
				'{"translate": "fetchr.lobby.machinery.sign.line4", "color":"#8eedeb"}'\
			]\
		}\
	}}, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1.3

execute \
	unless entity @e[type=minecraft:marker, tag=fetchr.lobby_sign, nbt={data: {\
		front_text: {\
			messages: [\
				'{"translate":"fetchr.lobby.machinery.sign.line1", "bold":true, "color":"#8eedeb"}',\
				'{"translate": "fetchr.lobby.machinery.sign.line2", "color":"#8eedeb"}',\
				'{"translate": "fetchr.lobby.machinery.sign.line3", "color":"#8eedeb"}',\
				'{"translate": "fetchr.lobby.machinery.sign.line4", "color":"#8eedeb"}'\
			]\
		}\
	}}, limit=1] \
	if entity @e[type=minecraft:marker, tag=fetchr.lobby_sign, nbt={data: {\
		Text1: '{"translate":"fetchr.lobby.machinery.sign.line1", "bold":true, "color":"#8eedeb"}',\
		Text2: '{"translate": "fetchr.lobby.machinery.sign.line2", "color":"#8eedeb"}',\
		Text3: '{"translate": "fetchr.lobby.machinery.sign.line3", "color":"#8eedeb"}',\
		Text4: '{"translate": "fetchr.lobby.machinery.sign.line4", "color":"#8eedeb"}'\
	}}, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1.3