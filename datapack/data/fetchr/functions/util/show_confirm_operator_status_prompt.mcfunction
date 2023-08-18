#> fetchr:util/show_confirm_operator_status_prompt
#
# This function prints the prompt for changing strict mode.
#
# @public
# @context entity Player changing the setting

tellraw @s ["\n\n\n\n\n", {"translate": "fetchr.operator_only.confirm_op", "with": [{"translate": "fetchr.operator_only.confirm_op.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/function fetchr:util/confirm_operator_status"}}]}]