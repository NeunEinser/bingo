#> fetchr:custom_hud/component_eval/slot/0_1
#
# Binary tree
#
# @within function fetchr:custom_hud/component_eval/slot/0_4

execute if score $custom_hud/eval.slot fetchr.tmp matches 0 run data modify block 7 0 7 Text1 set value '["\\uffa5",[{"storage":"io.fetchr:custom_hud","nbt":"component.textComponent","interpret":true,"font":"fetchr:line6"},{"storage":"io.fetchr:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true}],[{"storage":"io.fetchr:custom_hud","nbt":"component.iconFont[6]","interpret":true},{"storage":"io.fetchr:custom_hud","nbt":"component.icon","interpret":true}],{"storage":"io.fetchr:custom_hud","nbt":"component.padding","interpret":true}]'
execute if score $custom_hud/eval.slot fetchr.tmp matches 1 run data modify block 7 0 7 Text1 set value '["\\uffa5",[{"storage":"io.fetchr:custom_hud","nbt":"component.textComponent","interpret":true,"font":"fetchr:line7"},{"storage":"io.fetchr:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true}],[{"storage":"io.fetchr:custom_hud","nbt":"component.iconFont[7]","interpret":true},{"storage":"io.fetchr:custom_hud","nbt":"component.icon","interpret":true}],{"storage":"io.fetchr:custom_hud","nbt":"component.padding","interpret":true}]'