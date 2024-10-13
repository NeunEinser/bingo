#> fetchr:util/string/until
#
# Returns the input string excluding everything after the given util-index.
#
# @public
# @params until: int
# @intput storage io.fetchr:util string
# @outputs storage io.fetchr:util string

$data modify storage io.fetchr:util string set string storage io.fetchr:util string 0 $(until)