#> fetchr:card_generation/recalculate_item_weight/exec
#
# In case items where removed in the handle_removed_items function that have multiple
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
# @within function fetchr:card_generation/update_affected_item_weights/exec

scoreboard players set $card_gen.available_category_weight fetchr.tmp 1
scoreboard players set $card_gen/item_weight.i fetchr.tmp 0
function fetchr:card_generation/recalculate_item_weight/calculate_requried_available_category_weight { i: 0 }

scoreboard players set $card_gen.total_weight fetchr.tmp 0
scoreboard players set $card_gen/item_weight.i fetchr.tmp 0
function fetchr:card_generation/recalculate_item_weight/iter { i: 0 }