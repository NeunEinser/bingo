
#> fetchr:init/setup_resourcepack_check/create
#
# Creates the resourcepack check area assuming the area is loaded
#
# @within
# 	function fetchr:init/setup_resourcepack_check/exec
# @context dimension the resourcepack check dimension

fill 0 0 0 2 3 2 minecraft:black_concrete outline
setblock 1 2 2 minecraft:sea_lantern
setblock 1 2 1 minecraft:warped_wall_sign{ front_text: { messages: [\
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


#>
# @private
#declare tag fetchr.detect_mp_aec
kill @e[type=minecraft:marker, tag=fetchr.detect_mp_aec]
summon minecraft:marker 0 0 0 {\
	CustomName: { translate: "fetchr.technical.detect_multiplayer" },\
	Tags: ["fetchr.detect_mp_aec"]\
}

kill @e[type=minecraft:marker, tag=fetchr.string_tester]
summon minecraft:marker 0 0 0 { Tags: ["fetchr.string_tester"]}

kill @e[type=minecraft:marker, tag=fetchr.pos_reader]
execute \
	in minecraft:overworld \
	run summon minecraft:marker 0 0 0 { Tags: ["fetchr.pos_reader"]}

setblock 6 0 7 minecraft:barrel
setblock 7 0 7 minecraft:oak_sign{ front_text: { messages: ["", "", "", ""]}}

execute \
	if score $is_multiplayer fetchr.state matches 1 \
	at @e[tag=fetchr.multiplayer_mangrove_button_north] \
	run setblock ~ ~ ~ minecraft:mangrove_button[facing=north]

schedule function fetchr:init/items/exec 1t

forceload remove all
forceload add 0 0

function fetchr:custom_hud/components/timer/update