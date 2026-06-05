#> fetchr:util/string/concat
#
# Concatanates two input strings.
# Allows for unescaped quotation marks or un-stringified nbt.
#
# @public
# @context dimension fetchr:lobby
# @input storage io.fetchr:util concat_strings
# @outputs storage io.fetchr:util string

#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages set value [\
	'{ "storage": "io.fetchr:util", "nbt": "concat_strings.first" }',\
	'{ "storage": "io.fetchr:util", "nbt": "concat_strings.second" }',\
	'""',\
	'""'\
]

#data \
	modify storage tmp.fetchr:util concat_strings.first \
	set string block 7 0 7 front_text.messages[0] 1 -1

#data \
	modify storage tmp.fetchr:util concat_strings.second \
	set string block 7 0 7 front_text.messages[1] 1 -1
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify storage tmp.fetchr:util concat_strings.first set value []
data modify storage tmp.fetchr:util concat_strings.second set value []
data modify storage tmp.fetchr:util concat_strings.first append from storage io.fetchr:util concat_strings.first
data modify storage tmp.fetchr:util concat_strings.second append from storage io.fetchr:util concat_strings.second
data modify block 7 0 7 front_text.messages set value [\
	{ "storage": "tmp.fetchr:util", "nbt": "concat_strings.first", plain: true },\
	{ "storage": "tmp.fetchr:util", "nbt": "concat_strings.second", plain: true },\
	"",\
	"",\
]

#NEUN_SCRIPT until 98
#data \
	modify storage tmp.fetchr:util concat_strings.quote \
	set string block 7 0 7 front_text.messages[0] 1 2

#data \
	modify storage io.fetchr:util string \
	set string block 7 0 7 front_text.messages[0] 2 -2
#NEUN_SCRIPT end
#NEUN_SCRIPT since 98
data \
	modify storage tmp.fetchr:util concat_strings.quote \
	set from block 7 0 7 front_text.messages[0].extra[2]

#NEUN_SCRIPT until 99.2
#data \
	modify storage io.fetchr:util string \
	set from block 7 0 7 front_text.messages[0].extra[3].text
#NEUN_SCRIPT end
#NEUN_SCRIPT since 99.2
data \
	modify storage io.fetchr:util string \
	set from block 7 0 7 front_text.messages[0].extra[3]
#NEUN_SCRIPT end
#NEUN_SCRIPT end

execute \
	if data storage tmp.fetchr:util concat_strings{quote: "'"} \
	run function fetchr:util/string/convert_single_quote_escaped_to_double_quote_escaped \
		with storage io.fetchr:util

data \
	modify storage tmp.fetchr:util concat_strings.first \
	set from storage io.fetchr:util string

#NEUN_SCRIPT until 98
#data \
	modify storage tmp.fetchr:util concat_strings.quote \
	set string block 7 0 7 front_text.messages[1] 1 2

#data \
	modify storage io.fetchr:util string \
	set string block 7 0 7 front_text.messages[1] 2 -2
#NEUN_SCRIPT end
#NEUN_SCRIPT since 98
data \
	modify storage tmp.fetchr:util concat_strings.quote \
	set from block 7 0 7 front_text.messages[1].extra[2]

#NEUN_SCRIPT until 99.2
#data \
	modify storage io.fetchr:util string \
	set from block 7 0 7 front_text.messages[1].extra[3].text
#NEUN_SCRIPT end
#NEUN_SCRIPT since 99.2
data \
	modify storage io.fetchr:util string \
	set from block 7 0 7 front_text.messages[1].extra[3]
#NEUN_SCRIPT end
#NEUN_SCRIPT end

execute \
	if data storage tmp.fetchr:util concat_strings{quote: "'"} \
	run function fetchr:util/string/convert_single_quote_escaped_to_double_quote_escaped \
		with storage io.fetchr:util

data \
	modify storage tmp.fetchr:util concat_strings.second \
	set from storage io.fetchr:util string
#NEUN_SCRIPT end

function fetchr:util/string/concat_escaped with storage tmp.fetchr:util concat_strings