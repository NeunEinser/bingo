
$data \
	modify storage fetchr:card slots[$(card_slot)] merge value {\
		revealed: true,\
		current_display: [\
			"",\
			{ text: "\u0002", font: "fetchr:space" },\
			"\u$(icon)"\
		]\
	}

$tellraw @a {translate: "fetchr.item_revealed", with: [{selector: "@s"}, {translate: "$(translation)"}]}
execute \
	as @a \
	at @s \
	run playsound minecraft:block.end_portal_frame.fill voice @s

function fetchr:util/update_card