
$execute \
	if items entity @s player.cursor minecraft:air \
	run item replace entity @s player.cursor from block ~ ~ ~ container.$(slot_id)
$execute \
	if items entity @s player.cursor minecraft:gray_stained_glass_pane[minecraft:item_model="fetchr:hidden"] \
	run item replace entity @s player.cursor from block ~ ~ ~ container.$(slot_id)
$item replace block ~ ~ ~ container.$(slot_id) with minecraft:gray_stained_glass_pane[minecraft:item_model="fetchr:hidden",minecraft:tooltip_display={hide_tooltip:true}]