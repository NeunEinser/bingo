#> fetchr:util/until_quote_iter
#
# @within
# 	function fetchr:util/until_quote
# 	function fetchr:util/until_quote_iter
# @params ::fetchr::storages::util::UntilQuoteIterData
# @outputs storage io.fetchr:util chars

$data modify storage tmp.fetchr:util until_quote.current set value "$(current)$(char)"
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
	unless data storage tmp.fetchr:util concat_strings{ second: '"' } \
	if score $util/string.length fetchr.tmp >= $util/string.index fetchr.tmp \
	run function fetchr:util/string/until_quote_iter with storage tmp.fetchr:util until_quote