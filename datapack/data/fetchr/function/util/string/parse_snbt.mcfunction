#> fetchr:util/string/parse_snbt
#
# Expects an snbt string.
# Outputs the resolved nbt.
#
# This is useful when stringifying nbt using a sign to get rid of the enclosing
# quotation marks and get the raw snbt string inside.
#
# @public
# @params snbt: #[nbt] string
# @outputs storage io.fetchr:util nbt

$data modify storage io.fetchr:util nbt set value $(snbt)