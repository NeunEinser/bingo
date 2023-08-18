#> fetchr:util/confirm_operator_status
#
# This function marks a player as operator 
#
# @internal
# @user

gamerule sendCommandFeedback false

scoreboard players set @s fetchr.operator 1
tellraw @s ["\n\n\n\n\n", {"translate": "fetchr.operator_only.confirm_op.success", "color": "green"}, "\n", {"translate": "fetchr.operator_only.confirm_op.success.info"}]