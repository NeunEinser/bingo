#> bingo:custom_hud/component_eval/0_1
#
# Binary tree
#
# @within function bingo:custom_hud/component_eval/0_4

execute if score $custom_hud/eval.slot bingo.tmp matches 0 run data modify block 7 0 7 Text1 set value '[{"translate":"space.-91"},[{"storage":"io.bingo:custom_hud","nbt":"component.textComponent","interpret":true,"font":"bingo:line6"},{"storage":"io.bingo:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true}],[{"storage":"io.bingo:custom_hud","nbt":"component.iconFont[6]","interpret":true},{"storage":"io.bingo:custom_hud","nbt":"component.icon","interpret":true}],{"storage":"io.bingo:custom_hud","nbt":"component.padding","interpret":true}]'
execute if score $custom_hud/eval.slot bingo.tmp matches 1 run data modify block 7 0 7 Text1 set value '[{"translate":"space.-91"},[{"storage":"io.bingo:custom_hud","nbt":"component.textComponent","interpret":true,"font":"bingo:line7"},{"storage":"io.bingo:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true}],[{"storage":"io.bingo:custom_hud","nbt":"component.iconFont[7]","interpret":true},{"storage":"io.bingo:custom_hud","nbt":"component.icon","interpret":true}],{"storage":"io.bingo:custom_hud","nbt":"component.padding","interpret":true}]'