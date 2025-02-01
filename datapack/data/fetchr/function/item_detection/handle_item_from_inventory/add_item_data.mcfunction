#> fetchr:item_detection/handle_item_from_inventory/add_item_data
#
# Finds the exact item stack for clearing
#
# @params
#	item_text_component: string
# @within function fetchr:item_detection/handle_item_from_inventory/exec

#NEUN_SCRIPT since 65
#$data \
	modify storage tmp.fetchr:item_detect item_text_component \
	set value '$(item_text_component),\
		"hoverEvent": {\
			"action": "show_item",\
			"contents": '

#data \
	modify storage io.fetchr:util concat_strings.first \
	set from storage tmp.fetchr:item_detect item_text_component
#data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage tmp.fetchr:item_detect item
#function fetchr:util/string/concat

#data \
	modify storage io.fetchr:util concat_strings.first \
	set from storage io.fetchr:util string
#data \
	modify storage io.fetchr:util concat_strings.second \
	set value " }}"
#function fetchr:util/string/concat

#data \
	modify storage tmp.fetchr:item_detect item_text_component \
	set from storage io.fetchr:util string
#NEUN_SCRIPT end
