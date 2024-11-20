#> fetchr:util/item_nbt_to_command_argument/remove_component
#
# Removes a component by name
#
# @within
# 	function fetchr:util/item_nbt_to_command_argument/*
# @params name: string
# @input io.fetchr:util string
# @output io.fetchr:util string

$data remove storage tmp.fetchr:util components.$(name)