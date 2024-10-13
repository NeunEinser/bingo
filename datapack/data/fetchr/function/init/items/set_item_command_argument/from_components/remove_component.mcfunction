#> fetchr:init/items/set_item_command_argument/from_components/append_snbt
#
# Removes a component by name
#
# @within
# 	function fetchr:init/items/set_item_command_argument/from_components/*
# @params name: string
# @input io.fetchr:util string
# @output io.fetchr:util string

$data remove storage tmp.fetchr:init components.$(name)
