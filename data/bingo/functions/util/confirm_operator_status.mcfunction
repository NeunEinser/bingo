#> bingo:util/confirm_operator_status
#
# This function prints the prompt for changing strict mode.
#
# @public
# @context entity Player changing the setting

tellraw @s ["\n\n\n", {"translate": "bingo.strict_mode.confirm_op", "with": [{"translate": "bingo.strict_mode.confirm_op.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set @s bingo.operator 1"}}]}]