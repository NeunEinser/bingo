#> bingo:custom_hud/component_eval/8_10
#
# Binary tree
#
# @within function bingo:custom_hud/component_eval/5_10

execute if score $custom_hud/eval.slot bingo.tmp matches 8 run data modify block 7 0 7 Text1 set value '[{"storage":"io.bingo:custom_hud","nbt":"component.padding","interpret":true},[{"storage":"io.bingo:custom_hud","nbt":"component.iconFont[8]","interpret":true},{"storage":"io.bingo:custom_hud","nbt":"component.icon","interpret":true}],[{"storage":"io.bingo:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true,"font":"bingo:line8"},{"storage":"io.bingo:custom_hud","nbt":"component.textComponent","interpret":true}],{"translate":"space.-91"}]'
execute if score $custom_hud/eval.slot bingo.tmp matches 9 run data modify block 7 0 7 Text1 set value '[{"storage":"io.bingo:custom_hud","nbt":"component.padding","interpret":true},[{"storage":"io.bingo:custom_hud","nbt":"component.iconFont[9]","interpret":true},{"storage":"io.bingo:custom_hud","nbt":"component.icon","interpret":true}],[{"storage":"io.bingo:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true,"font":"bingo:line9"},{"storage":"io.bingo:custom_hud","nbt":"component.textComponent","interpret":true}],{"translate":"space.-91"}]'
execute if score $custom_hud/eval.slot bingo.tmp matches 10 run data modify block 7 0 7 Text1 set value '[{"storage":"io.bingo:custom_hud","nbt":"component.padding","interpret":true},[{"storage":"io.bingo:custom_hud","nbt":"component.iconFont[10]","interpret":true},{"storage":"io.bingo:custom_hud","nbt":"component.icon","interpret":true}],[{"storage":"io.bingo:custom_hud","nbt":"component.iconSeparatorAlignRight","interpret":true,"font":"bingo:line10"},{"storage":"io.bingo:custom_hud","nbt":"component.textComponent","interpret":true}],{"translate":"space.-91"}]'