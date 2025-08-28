#> fetchr:util/show_confirm_operator_status_prompt
#
# This function prints the prompt for changing strict mode.
#
# @public
# @context entity Player changing the setting

#NEUN_SCRIPT until 77
#tellraw @s [\
	"\n\n\n\n\n",\
	{\
		"translate": "fetchr.operator_only.confirm_op",\
		"with": [\
			{\
				"translate": "fetchr.operator_only.confirm_op.click",\
				"color": "#00c3ff",\
				"clickEvent": { "action": "run_command", "value": "/function fetchr:util/confirm_operator_status" },\
				"click_event": { "action": "run_command", "command": "function fetchr:util/confirm_operator_status" }\
			}\
		]\
	}\
]
#NEUN_SCRIPT end

#NEUN_SCRIPT since 77
dialog show @s fetchr:confirm_operator_status
#NEUN_SCRIPT end