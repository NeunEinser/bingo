#> fetchr:custom_hud/update_actionbar/0_2
#
# Binary tree
#
# @within function fetchr:custom_hud/update_actionbar/0_5

execute if score $custom_hud/update.components fetchr.tmp matches 0 run title @s actionbar [{"storage":"fetchr:tmp","nbt":"cardOffset","interpret":true,"font":"fetchr:space"},{"storage":"fetchr:card","nbt":"teams[-1].card","interpret":true},{"storage":"fetchr:tmp","nbt":"cardNegOffset","interpret":true}]
execute if score $custom_hud/update.components fetchr.tmp matches 1 run title @s actionbar [{"text":"\u0001","font":"fetchr:space"},{"text":"\uffff","font":"fetchr:space"},{"storage":"tmp.fetchr:custom_hud","nbt":"texts[0]","interpret":true},{"storage":"fetchr:tmp","nbt":"cardOffset","interpret":true},{"storage":"fetchr:card","nbt":"teams[-1].card","interpret":true},{"storage":"fetchr:tmp","nbt":"cardNegOffset","interpret":true}]
execute if score $custom_hud/update.components fetchr.tmp matches 2 run title @s actionbar [{"text":"\u0001","font":"fetchr:space"},{"text":"\uffff","font":"fetchr:space"},{"storage":"tmp.fetchr:custom_hud","nbt":"texts[0]","interpret":true},{"storage":"tmp.fetchr:custom_hud","nbt":"texts[1]","interpret":true},{"storage":"fetchr:tmp","nbt":"cardOffset","interpret":true},{"storage":"fetchr:card","nbt":"teams[-1].card","interpret":true},{"storage":"fetchr:tmp","nbt":"cardNegOffset","interpret":true}]
