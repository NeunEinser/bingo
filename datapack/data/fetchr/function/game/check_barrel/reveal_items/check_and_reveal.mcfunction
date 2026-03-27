
$execute \
	if items block ~ ~ ~ container.$(barrel_slot) $(command_argument) \
	run function fetchr:game/check_barrel/reveal_items/reveal { card_slot: $(card_slot), icon: "$(icon)", translation: "$(translation)" }