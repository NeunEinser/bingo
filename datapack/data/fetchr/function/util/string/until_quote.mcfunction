#> fetchr:util/until_quote
#
# Modifies the given string to be truncated after the first quote.
#
# @public
# @input storage io.fetchr:util string
# @outputs storage io.fetchr:util string

data modify storage tmp.fetchr:util string set from storage io.fetchr:util string
data modify storage tmp.fetchr:util until_quote set value {current:"", start: 1, end: 2}
data modify storage tmp.fetchr:util until_quote.char set string storage tmp.fetchr:util string 0 1
execute store result score $util/string.length fetchr.tmp run data get storage tmp.fetchr:util string
scoreboard players add $util/string.length fetchr.tmp 1

execute \
	unless data storage tmp.fetchr:util until_quote{char: '"'} \
	run function fetchr:util/string/until_quote_iter with storage tmp.fetchr:util until_quote

data modify storage io.fetchr:util string set from storage tmp.fetchr:util until_quote.current