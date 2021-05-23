#> bingo:actionbar_display/display_card_schedule
#
# Schedule responsible for showing the card display, to not run it every tick.
#
# @internal

execute as @a run function bingo:actionbar_display/display_card
schedule function bingo:actionbar_display/display_card_schedule 1s