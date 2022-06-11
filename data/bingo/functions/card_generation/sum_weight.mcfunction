execute store result score $tmp bingo.tmp run data get storage tmp.bingo:card_generation itemCpy[-1].weight
scoreboard players operation $card_gen.control_weight bingo.tmp += $tmp bingo.tmp

data remove storage tmp.bingo:card_generation itemCpy[-1]
execute if data storage tmp.bingo:card_generation itemCpy[0] run function bingo:card_generation/sum_weight