#> fetchr:util/string/nbt_to_snbt
#
# Appends the current text component to io.fetchr string
#
# @within function fetchr:util/string/nbt_to_snbt
# @context dimension fetchr:lobby

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:util text_component \
	set from storage tmp.fetchr:util snbt_stack[-1]

execute \
	if data storage tmp.fetchr:util text_component{} \
	run return run function fetchr:util/string/nbt_to_snbt/handle_compound

execute \
	if data storage tmp.fetchr:util text_component[0] \
	run return run function fetchr:util/string/nbt_to_snbt/handle_list

execute \
	store success score $util.is_list fetchr.tmp \
	run data modify storage tmp.fetchr:util text_component append value ""

execute \
	unless score $util.is_list fetchr.tmp matches 1 \
	run function fetchr:util/string/nbt_to_snbt/handle_string

data remove storage tmp.fetchr:util snbt_stack[-1]