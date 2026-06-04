#> fetchr:util/string/nbt_to_snbt
#
# Converts a given nbt value to its stringified form.
#
# @public
# @intput storage io.fetchr:util nbt
# @output storage io.fetchr:util string
# @context dimension fetchr:lobby

#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages[0] set value '{\
	"storage": "io.fetchr:util",\
	"nbt": "nbt"\
}'
#data \
	modify storage tmp.fetchr:util inner_snbt.snbt \
	set from block 7 0 7 front_text.messages[0]
#function fetchr:util/string/parse_snbt \
	with storage tmp.fetchr:util inner_snbt

#data \
	modify storage io.fetchr:util string \
	set from storage io.fetchr:util nbt
#NEUN_SCRIPT end

#NEUN_SCRIPT since 69
data modify block 7 0 7 front_text.messages[0] set value {\
	storage: "io.fetchr:util",\
	nbt: "nbt",\
	plain: true\
}

data modify storage tmp.fetchr:util snbt_stack set value []
data \
	modify storage tmp.fetchr:util snbt_stack \
	append from block 7 0 7 front_text.messages[0]

data modify storage io.fetchr:util string set value ""
function fetchr:util/string/nbt_to_snbt/append_text_component
#NEUN_SCRIPT end