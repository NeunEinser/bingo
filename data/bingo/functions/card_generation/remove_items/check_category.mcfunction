#> bingo:card_generation/remove_items/check_category
#
# Checks if the current category is part of itemCategories
#
# @within bingo:card_generation/remove_items/**

data modify storage tmp.bingo:card_generation category set from storage tmp.bingo:card_generation categories[-1]
execute store result score $card_gen/remove_items.keep_item bingo.tmp run data modify storage tmp.bingo:card_generation category set from storage tmp.bingo:card_generation itemCategories[-1].id
execute if score $card_gen/remove_items.keep_item bingo.tmp matches 1 run data modify storage tmp.bingo:card_generation secondaryCategories append from storage tmp.bingo:card_generation itemCategories[-1]

data remove storage tmp.bingo:card_generation itemCategories[-1]
execute if score $card_gen/remove_items.keep_item bingo.tmp matches 1 if data storage tmp.bingo:card_generation itemCategories[0] run function bingo:card_generation/remove_items/check_category