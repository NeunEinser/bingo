#> bingo:custom_hud/components/timer/eval_non_default
#
# In case a player doesn't use the default slot for the timer, this additional
# slot needs to be evaluated.
#
# @within function bingo:custom_hud/components/timer/update

execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 1b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_1
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 2b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_2
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 3b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_3
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 4b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_4
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 5b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_5
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 6b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_6
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 7b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_7
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 8b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_8
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 9b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_9
execute if data storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 10b}] run function bingo:custom_hud/components/timer/eval_non_default/slot_10