#> fetchr:util/string/get_next_compound_key
#
# Gets the next compound key of the given compound
#
# @public
# @input storage io.fetchr:util string
# @outputs storage io.fetchr:util string

data modify storage io.fetchr:util string set value ""

execute \
	unless data storage io.fetchr:util nbt{} \
	run return 0
execute \
	store result score $util/next_compound_key.size fetchr.tmp \
	run data get storage io.fetchr:util nbt
execute \
	if score $util/next_compound_key.size fetchr.tmp matches 0 \
	run return 0

#NEUN_SCRIPT until 69
#data \
	modify block 7 0 7 front_text.messages[0] \
	set value '{ "storage": "io.fetchr:util", "nbt": "nbt" }'
#data modify storage tmp.fetchr:util inner_snbt.snbt set from block 7 0 7 front_text.messages[0]
#function fetchr:util/string/parse_snbt with storage tmp.fetchr:util inner_snbt

#data modify storage tmp.fetchr:util snbt set from storage io.fetchr:util nbt

#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data \
	modify block 7 0 7 front_text.messages[0] \
	set value { storage: "io.fetchr:util", nbt: "nbt", plain: true }

#NEUN_SCRIPT until 98
#data modify storage tmp.fetchr:util snbt set from block 7 0 7 front_text.messages[0]
#NEUN_SCRIPT end
#NEUN_SCRIPT end

#NEUN_SCRIPT until 98
#data modify storage tmp.fetchr:util char set string storage tmp.fetchr:util snbt 1 2
#data modify storage io.fetchr:util string set string storage tmp.fetchr:util snbt 2

#execute \
	unless data storage tmp.fetchr:util { char: '"' } \
	unless data storage tmp.fetchr:util { char: "'" } \
	run data modify storage io.fetchr:util string set string storage tmp.fetchr:util snbt 1

#execute \
	if data storage tmp.fetchr:util { char: '"' } \
	run function fetchr:util/string/until_double_quote
#execute \
	if data storage tmp.fetchr:util { char: "'" } \
	run function fetchr:util/string/until_single_quote

#execute \
	unless data storage tmp.fetchr:util { char: '"' } \
	unless data storage tmp.fetchr:util { char: "'" } \
	run function fetchr:util/string/until_colon
#NEUN_SCRIPT end
#NEUN_SCRIPT since 98
data modify storage tmp.fetchr:util char set value ""
data modify storage tmp.fetchr:util text_component set from block 7 0 7 front_text.messages[0].extra[2]
execute \
	if data storage tmp.fetchr:util text_component.extra \
	run data modify storage tmp.fetchr:util char set from storage tmp.fetchr:util text_component.text
execute \
	if data storage tmp.fetchr:util text_component.extra \
	run data modify storage io.fetchr:util string set from storage tmp.fetchr:util text_component.extra[0]
#NEUN_SCRIPT until 99.2
#execute \
	unless data storage tmp.fetchr:util text_component.extra \
	run data modify storage io.fetchr:util string set from storage tmp.fetchr:util text_component.text
#NEUN_SCRIPT end
#NEUN_SCRIPT since 99.2
execute \
	unless data storage tmp.fetchr:util text_component.extra \
	run data modify storage io.fetchr:util string set from storage tmp.fetchr:util text_component
#NEUN_SCRIPT end
#NEUN_SCRIPT end

execute \
	unless score $quote_for_path_argument fetchr.io matches 1 \
	run return 0

scoreboard players reset $quote_for_path_argument fetchr.io

#NEUN_SCRIPT until 98
#execute \
	if score $util/string.contains_dot fetchr.io matches 0 \
	if score $util/string.contains_quote fetchr.io matches 0 \
	if score $util/string.contains_space fetchr.io matches 0 \
	run return 0
#NEUN_SCRIPT end
#NEUN_SCRIPT since 98
function fetchr:util/string/check_if_requires_path_parameter_quoting
execute \
	if score $util/string.requires_path_parameter_quoting fetchr.io matches 0 \
	run return 0
#NEUN_SCRIPT end

execute \
	if data storage tmp.fetchr:util { char: "'" } \
	run data modify storage io.fetchr:util concat_strings.first set value "'"
execute \
	unless data storage tmp.fetchr:util { char: "'" } \
	run data modify storage io.fetchr:util concat_strings.first set value '"'

data modify storage io.fetchr:util concat_strings.second set from storage io.fetchr:util string
function fetchr:util/string/concat

execute \
	if data storage tmp.fetchr:util { char: "'" } \
	run data modify storage io.fetchr:util concat_strings.second set value "'"
execute \
	unless data storage tmp.fetchr:util { char: "'" } \
	run data modify storage io.fetchr:util concat_strings.second set value '"'

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
function fetchr:util/string/concat

execute \
	unless score $util/string.contains_dot fetchr.io matches 0 \
	run return 0
execute \
	unless score $util/string.contains_quote fetchr.io matches 0 \
	run return 0

data modify storage tmp.fetchr:util inner_snbt.snbt set from storage io.fetchr:util string
function fetchr:util/string/parse_snbt with storage tmp.fetchr:util inner_snbt
data modify storage io.fetchr:util string set from storage io.fetchr:util nbt
