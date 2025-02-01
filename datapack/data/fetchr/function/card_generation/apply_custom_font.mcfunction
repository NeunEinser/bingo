#> fetchr:card_generation/apply_custom_font
#
# Sets the icon display to use the provided custom font
#
# @within function fetchr:card_generation/generate_slot
# @params ::fetchr::storage::card::CardSlot

#NEUN_SCRIPT until 65
#$data \
	modify storage fetchr:card slots[-1].icon_display \
	set value '{ "text": "\\u$(icon)", "font": "$(current_font)" }'

#$execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[-1].current_display set value '[\
		"",\
		{ "text": "\\u0002", "font": "fetchr:space" },\
		{ "text": "\\u$(icon)", "font": "$(current_font)" }\
	]'
#NEUN_SCRIPT end

#NEUN_SCRIPT since 65
$data \
	modify storage fetchr:card slots[-1].icon_display \
	set value { text: "\u$(icon)", font: "$(current_font)" }

$execute \
	unless score $blind_mode fetchr.state matches 1 \
	run data \
		modify storage fetchr:card slots[-1].current_display set value [\
		"",\
		{ text: "\u0002", font: "fetchr:space" },\
		{ text: "\u$(icon)", font: "$(current_font)" }\
	]
#NEUN_SCRIPT end