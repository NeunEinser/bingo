#> fetchr:init/setup_resource_pack_check
#
# Creates the resource pack check area
#
# @within fetchr:init/init

fill 0 0 0 2 3 2 minecraft:black_concrete outline
setblock 1 2 2 minecraft:sea_lantern
#NEUN_SCRIPT until 69
#execute \
	if entity @a[tag=fetchr.resourcepack_check, limit=1] \
	run setblock 1 2 1 minecraft:warped_wall_sign{ front_text: { messages: [\
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
	]}}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if entity @a[tag=fetchr.resourcepack_check, limit=1] \
	run setblock 1 2 1 minecraft:warped_wall_sign{ front_text: { messages: [\
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
	]}}
#NEUN_SCRIPT end

teleport @a[x=0] 1 1 1