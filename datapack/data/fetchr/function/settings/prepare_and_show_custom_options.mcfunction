#> fetchr:settings/prepare_and_show_custom_options
#
# Function that sets all the macro arguments for the custom options dialog and
# then shows the dialog
#
# @within function fetchr:settings/handle_settings

data modify storage tmp.fetchr:settings/dialog custom_options set value {\
	concealed_card: "off"\
}

execute \
	if score $concealed_card fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.concealed_card set value "on"

function fetchr:settings/show_custom_options_dialog with storage tmp.fetchr:settings/dialog custom_options