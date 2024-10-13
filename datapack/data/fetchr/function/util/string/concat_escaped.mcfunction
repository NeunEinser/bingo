#> fetchr:util/string/concat_escaped
#
# Concatanates two input strings.
# If either of the strings contains quotation marks, they need to be escaped.
#
# @public
# @params
# 	first: string
# 	second: string
# @outputs storage io.fetchr:util string

$data modify storage io.fetchr:util string set value "$(first)$(second)"