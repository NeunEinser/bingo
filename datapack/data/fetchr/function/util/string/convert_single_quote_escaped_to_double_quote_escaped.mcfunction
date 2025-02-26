#> fetchr:util/string/convert_single_quote_escaped_to_double_quote_escaped
#
# Converts a string that is escaped properly when using double quotes to be
# escaped when using single quotes.
#
# @public
# @params
# 	string: string
# @outputs storage io.fetchr:util string

$data modify storage tmp.fetchr:util convert_quote_type.string set value '\'$(string)'
data modify storage tmp.fetchr:util convert_quote_type.list set value []
data \
	modify storage tmp.fetchr:util convert_quote_type.list \
	append from storage tmp.fetchr:util convert_quote_type.string
data \
	modify block 7 0 7 front_text.messages[0] \
	set value { storage: "tmp.fetchr:util", nbt: "convert_quote_type.list" }

data \
	modify storage io.fetchr:util string \
	set string block 7 0 7 front_text.messages[0] 3 -2