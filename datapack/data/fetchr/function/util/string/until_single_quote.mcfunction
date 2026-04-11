#> fetchr:util/string/until_single_quote
#
# Modifies the given string to be truncated after the first unescaped single quote.
#
# @public
# @input storage io.fetchr:util string
# @outputs storage io.fetchr:util string

data modify storage tmp.fetchr:util string set from storage io.fetchr:util string
data modify storage tmp.fetchr:util until_quote set value { start: 0, end: 1 }
execute \
	store result score $util/string.length fetchr.tmp \
	run data get storage tmp.fetchr:util string
scoreboard players add $util/string.length fetchr.tmp 1

scoreboard players set $util/string.escaped fetchr.tmp 0
scoreboard players set $util/string.until fetchr.tmp -1
scoreboard players set $util/string.contains_quote fetchr.io 0
scoreboard players set $util/string.contains_dot fetchr.io 0
scoreboard players set $util/string.contains_backslash fetchr.io 0

function fetchr:util/string/until_single_quote_iter with storage tmp.fetchr:util until_quote

execute \
	store result storage tmp.fetchr:util until.until int 1 \
	run scoreboard players get $util/string.until fetchr.tmp
function fetchr:util/string/until with storage tmp.fetchr:util until