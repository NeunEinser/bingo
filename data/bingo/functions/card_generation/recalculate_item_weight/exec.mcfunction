#> bingo:card_generation/recalculate_item_weight/exec
#
# In case items where removed in the remove_items function that have multiple
# categories, the total weight of these secondary categories has to be
# recalcualted.
#
# In the previous step, the above mentioned was done and an attempt was made to
# re-calculate the item score.
#
# However, that attempt failed because the previous available category weight
# did not suffice the needs of the current categories anymore, which means
# all items need to be recalculated using a new available category weight.
#
# @within function bingo:card_generation/update_category_total_weight/exec

scoreboard players operation $card_gen.available_category_weight bingo.tmp = $card_gen.required_category_weight bingo.tmp
scoreboard players set $card_gen.total_weight bingo.tmp 0
data modify storage tmp.bingo:card_generation recalculateItems set from storage tmp.bingo:card_generation items
data modify storage tmp.bingo:card_generation items set value []
function bingo:card_generation/recalculate_item_weight/iter