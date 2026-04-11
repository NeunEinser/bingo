#> fetchr:util/string/until_single_quote_iter
#
# @within
# 	function fetchr:util/string/until_single_quote
# 	function fetchr:util/string/until_single_quote_iter
# @params ::fetchr::storages::util::UntilQuoteIterData
# @outputs storage io.fetchr:util chars

scoreboard players add $util/string.until fetchr.tmp 1
execute \
	if score $util/string.escaped fetchr.tmp matches 2 \
	run scoreboard players set $util/string.escaped fetchr.tmp 0

$data modify storage tmp.fetchr:util until_quote.char set string storage tmp.fetchr:util string $(start) $(end)

execute \
	store result score $util/string.index fetchr.tmp \
	run data get storage tmp.fetchr:util until_quote.start
execute \
	store result storage tmp.fetchr:util until_quote.start int 1 \
	run scoreboard players add $util/string.index fetchr.tmp 1
execute \
	store result storage tmp.fetchr:util until_quote.end int 1 \
	run scoreboard players add $util/string.index fetchr.tmp 1

execute \
	if score $util/string.escaped fetchr.tmp matches 1 \
	run scoreboard players set $util/string.escaped fetchr.tmp 2
execute \
	if data storage tmp.fetchr:util until_quote{ char: "\\" } \
	if score $util/string.escaped fetchr.tmp matches 0 \
	run scoreboard players set $util/string.escaped fetchr.tmp 1

execute \
	if score $util/string.escaped fetchr.tmp matches 1 \
	run scoreboard players set $util/string.contains_backslash fetchr.io 1

execute \
	if data storage tmp.fetchr:util until_quote{ char: "." } \
	run scoreboard players set $util/string.contains_dot fetchr.io 1

execute \
	if data storage tmp.fetchr:util until_quote{ char: "'" } \
	if score $util/string.escaped fetchr.tmp matches 2 \
	run scoreboard players set $util/string.contains_quote fetchr.io 1

execute \
	if data storage tmp.fetchr:util until_quote{ char: '"' } \
	run scoreboard players set $util/string.contains_quote fetchr.io 1

execute \
	if score $util/string.escaped fetchr.tmp matches 2 \
	run data remove storage tmp.fetchr:util until_quote.char

execute \
	unless data storage tmp.fetchr:util until_quote{ char: "'" } \
	if score $util/string.length fetchr.tmp >= $util/string.index fetchr.tmp \
	run function fetchr:util/string/until_single_quote_iter with storage tmp.fetchr:util until_quote