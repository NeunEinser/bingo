#> bingo:custom_hud/update_actionbar/0_2
#
# Binary tree
#
# @within function bingo:custom_hud/update_actionbar/0_5

execute if score $custom_hud/update.components bingo.tmp matches 0 run title @s actionbar [{"storage":"bingo:tmp","nbt":"cardOffset","interpret":true,"font":"space:default"},{"storage":"bingo:card","nbt":"teams[-1].card","interpret":true},{"storage":"bingo:tmp","nbt":"cardNegOffset","interpret":true}]
execute if score $custom_hud/update.components bingo.tmp matches 1 run title @s actionbar [{"translate":"space.1","font":"space:default"},{"translate":"space.-1","font":"space:default"},{"storage":"tmp.bingo:custom_hud","nbt":"texts[0]","interpret":true},{"storage":"bingo:tmp","nbt":"cardOffset","interpret":true},{"storage":"bingo:card","nbt":"teams[-1].card","interpret":true},{"storage":"bingo:tmp","nbt":"cardNegOffset","interpret":true}]
execute if score $custom_hud/update.components bingo.tmp matches 2 run title @s actionbar [{"translate":"space.1","font":"space:default"},{"translate":"space.-1","font":"space:default"},{"storage":"tmp.bingo:custom_hud","nbt":"texts[0]","interpret":true},{"storage":"tmp.bingo:custom_hud","nbt":"texts[1]","interpret":true},{"storage":"bingo:tmp","nbt":"cardOffset","interpret":true},{"storage":"bingo:card","nbt":"teams[-1].card","interpret":true},{"storage":"bingo:tmp","nbt":"cardNegOffset","interpret":true}]
