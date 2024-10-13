#> fetchr:util/string/concat
#
# Concatanates two input strings.
# Allows for unescaped quotation marks or un-stringified nbt.
#
# @public
# @input storage io.fetchr:util concat_strings
# @outputs storage io.fetchr:util string

execute in fetchr:lobby run \
	data modify block 7 0 7 front_text.messages set value [\
		'{"storage": "io.fetchr:util", "nbt": "concat_strings.first"}',\
		'{"storage": "io.fetchr:util", "nbt": "concat_strings.second"}',\
		'""',\
		'""'\
	]
data modify storage io.fetchr:util string set string block 7 0 7 front_text.messages[0] 1
execute store result score $util.until fetchr.tmp run data get storage io.fetchr:util string
scoreboard players remove $util.until fetchr.tmp 1
execute store result storage tmp.fetchr:util substring.until int 1 run scoreboard players get $util.until fetchr.tmp

function fetchr:util/string/until with storage tmp.fetchr:util substring
data modify storage tmp.fetchr:util concat_strings.first set from storage io.fetchr:util string

data modify storage io.fetchr:util string set string block 7 0 7 front_text.messages[1] 1
execute store result score $util.until fetchr.tmp run data get storage io.fetchr:util string
scoreboard players remove $util.until fetchr.tmp 1
execute store result storage tmp.fetchr:util substring.until int 1 run scoreboard players get $util.until fetchr.tmp

function fetchr:util/string/until with storage tmp.fetchr:util substring
data modify storage tmp.fetchr:util concat_strings.second set from storage io.fetchr:util string

function fetchr:util/string/concat_escaped with storage tmp.fetchr:util concat_strings