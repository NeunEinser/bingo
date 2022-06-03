#> bingo:card_generation/update_category_total_weight/exec
#
# In case items where removed in the remove_items function that have multiple
# categories, the total weight of these secondary categories has to be
# recalcualted.
#
# This function recalculates said total weight and also attempts to recalculate
# the global weight of items.
#
# The recalculation of global item weights will fail in case the current
# available category weight does not make an even split possible for some items.
#
# @within function bingo:card_generation/cleanup_and_next_slot

data modify storage tmp.bingo:card_generation stringTesterTagCache set value ["bingo.string_tester"]
data modify storage tmp.bingo:card_generation stringTesterTagCache append from storage tmp.bingo:card_generation categoriesWithRemovedItem[].id
execute store result score $card_gen.aec_tag_count bingo.tmp run data get storage tmp.bingo:card_generation stringTesterTagCache
scoreboard players operation $card_gen.required_category_weight bingo.tmp = $card_gen.available_category_weight bingo.tmp

function bingo:card_generation/update_category_total_weight/iter

#>
# @private
#declare score_holder $card_gen.requires_item_recalc
scoreboard players operation $card_gen.requires_item_recalc bingo.tmp = $card_gen.available_category_weight bingo.tmp
scoreboard players operation $card_gen.requires_item_recalc bingo.tmp %= $card_gen.required_category_weight bingo.tmp

execute unless score $card_gen.requires_item_recalc bingo.tmp matches 0 run function bingo:card_generation/recalculate_item_weight/exec