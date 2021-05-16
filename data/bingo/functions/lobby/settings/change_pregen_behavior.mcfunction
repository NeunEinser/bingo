#> bingo:lobby/settings/change_pregen_behavior
#
# This function prints the prompt for changing pregen behavior.
#
# @within bingo:lobby/set_signs
# @user
# @context entity Player changing the setting

tellraw @s {"translate": "bingo.lobby.settings.automatic_pregen.info"}
execute if score $automatically_pregen bingo.settings matches 0 run tellraw @s ["[", {"translate": "bingo.lobby.settings.automatic_pregen.turn_on", "color": "green", "clickEvent": {"action": "run_command", "value": "/trigger bingo.settings set 21"}}, "]"]
execute if score $automatically_pregen bingo.settings matches 1 run tellraw @s ["[", {"translate": "bingo.lobby.settings.automatic_pregen.turn_off", "color": "red", "clickEvent": {"action": "run_command", "value": "/trigger bingo.settings set 22"}}, "]"]