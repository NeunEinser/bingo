#> bingo:actionbar_display/display_card_schedule
#
# Schedule responsible for showing the card display, to not run it every tick.
#
# @internal

#>
# @private
#declare score_holder $display_card

scoreboard players set $display_card bingo.debug_scdl 0

execute as @a run function bingo:actionbar_display/display_card
schedule function bingo:actionbar_display/display_card_schedule 1s

scoreboard players set $display_card bingo.debug_scdl 1