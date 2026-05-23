#> fetchr:tick/resource_pack_check
#
# Sets the resourcepack check sign repeatedly to update, if the resource pack
# check area is loaded
#
# @within fetchr:tick/tick

# Detect the resource pack not being active server-side (So either we are on a
# server, or resourcepack is missing in single player for some reason)
#
# Uses name-check from technical translation:
# - "fetchr.technical.detect_multiplayer" -> "DoNotTranslateThis<X>"
#    <X> being version-check iteration (3+) (also used below)
execute \
	if score $is_multiplayer fetchr.state matches 0 \
	unless score $integrated_server fetchr.state matches 1 \
	in fetchr:lobby positioned 0 0 0 \
	if entity @e[name="DoNotTranslateThis{NEUN_SCRIPT:rp_version}", distance=..0.1, limit=1] \
	run scoreboard players set $integrated_server fetchr.state 1
execute \
	unless score $integrated_server fetchr.state matches 1 \
	run scoreboard players set $is_multiplayer fetchr.state 1

# Place the sign in resource pack check chamber
execute \
	if entity @a[tag=fetchr.resourcepack_check, limit=1] \
	run setblock 1 2 1 minecraft:air

execute \
	if entity @a[tag=fetchr.resourcepack_check, limit=1] \
	run setblock 1 2 1 minecraft:warped_wall_sign
#NEUN_SCRIPT until 69
	#execute \
		if entity @a[tag=fetchr.resourcepack_check, limit=1] \
		run data modify block 1 2 1 front_text.messages set value [\
			'{\
				"translate": "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				"fallback": "%2$s",\
				"color": "#8eedeb",\
				"with": [\
					{ "translate": "fetchr.resourcepack_check.sign.line1" },\
					{ "translate": "fetchr.resourcepack_check.wrong_version.sign.line1", "fallback": "", "bold": true }\
				],\
				"clickEvent": { "action": "run_command", "value": "trigger fetchr.resource_pack_check" }\
			}',\
			'{\
				"translate": "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				"fallback": "%2$s",\
				"color": "#8eedeb",\
				"with": [\
					{ "translate": "fetchr.resourcepack_check.sign.line2" },\
					{\
						"translate": "fetchr.resourcepack_check.wrong_version.sign.line2",\
						"fallback": "Download",\
						"bold": true\
					}\
				]\
			}',\
			'{\
				"translate": "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				"fallback": "%2$s",\
				"color": "#8eedeb",\
				"with": [\
					{ "translate": "fetchr.resourcepack_check.sign.line3" },\
					{\
						"translate": "fetchr.resourcepack_check.wrong_version.sign.line3",\
						"fallback": "Resource Pack",\
						"bold": true\
					}\
				]\
			}',\
			'{\
				"translate": "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				"fallback": "%2$s",\
				"color": "#8eedeb",\
				"with": [\
					{ "translate": "fetchr.resourcepack_check.sign.line4" },\
					{\
						"translate": "fetchr.resourcepack_check.wrong_version.sign.line4",\
						"fallback": "",\
						"bold": true\
					}\
				]\
			}'\
		]
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
	execute \
		if entity @a[tag=fetchr.resourcepack_check, limit=1] \
		run data modify block 1 2 1 front_text.messages set value [\
			{\
				translate: "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				fallback: "%2$s",\
				color: "#8eedeb",\
				with: [\
					{ translate: "fetchr.resourcepack_check.sign.line1" },\
					{ translate: "fetchr.resourcepack_check.wrong_version.sign.line1", fallback: "", bold: true }\
				],\
				click_event: { action: "run_command", command: "trigger fetchr.resource_pack_check" }\
			},\
			{\
				translate: "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				fallback: "%2$s",\
				color: "#8eedeb",\
				with: [\
					{ translate: "fetchr.resourcepack_check.sign.line2" },\
					{\
						translate: "fetchr.resourcepack_check.wrong_version.sign.line2",\
						fallback: "Download",\
						bold: true\
					}\
				]\
			},\
			{\
				translate: "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				fallback: "%2$s",\
				color: "#8eedeb",\
				with: [\
					{ translate: "fetchr.resourcepack_check.sign.line3" },\
					{\
						translate: "fetchr.resourcepack_check.wrong_version.sign.line3",\
						fallback: "Resource Pack",\
						bold: true\
					}\
				]\
			},\
			{\
				translate: "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
				fallback: "%2$s",\
				color: "#8eedeb",\
				with: [\
					{ translate: "fetchr.resourcepack_check.sign.line4" },\
					{\
						translate: "fetchr.resourcepack_check.wrong_version.sign.line4",\
						fallback: "",\
						bold: true\
					}\
				]\
			}\
		]
#NEUN_SCRIPT end