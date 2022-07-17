#> fetchr:custom_hud/components/timer/update
#
# @within function fetchr:custom_hud/components/timer/tick

data modify storage io.fetchr:custom_hud component set value {icon: '"\\u0132"', changed: true}
data modify storage io.fetchr:custom_hud component.textComponent set from storage neun_einser.timer:display "hh:mm:ss" 

# set icon
#>
# @private
#declare score_holder $custom_hud/timer.daytime
execute store result score $custom_hud/timer.daytime fetchr.tmp run time query daytime

execute if score $custom_hud/timer.daytime fetchr.tmp matches 106..472 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0133"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 473..845 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0134"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 846..1227 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0135"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 1228..1616 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0136"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 1617..2016 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0137"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 2017..2425 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0138"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 2426..2847 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0139"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 2848..3282 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013A"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 3283..3731 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013B"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 3732..4197 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013C"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 4198..4682 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013D"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 4683..5189 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013E"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 5190..5722 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013F"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 5723..6277 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0100"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 6278..6810 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0101"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 6811..7317 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0102"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 7318..7802 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0103"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 7803..8268 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0104"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 8269..8717 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0105"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 8718..9152 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0106"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 9153..9574 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0107"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 9575..9983 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0108"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 9984..10383 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0109"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 10384..10772 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010A"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 10773..11154 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010B"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 11155..11527 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010C"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 11528..11894 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010D"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 11895..12254 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010E"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 12255..12609 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010F"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 12610..12959 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0110"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 12960..13304 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0111"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 13305..13644 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0112"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 13645..13981 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0113"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 13982..14314 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0114"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 14315..14644 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0115"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 14645..14972 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0116"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 14973..15297 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0117"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 15298..15620 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0118"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 15621..15941 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0119"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 15942..16260 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011A"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 16261..16578 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011B"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 16579..16895 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011C"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 16896..17211 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011D"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 17212..17527 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011E"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 17528..17842 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011F"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 17843..18157 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0120"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 18158..18472 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0121"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 18473..18788 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0122"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 18789..19104 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0123"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 19105..19421 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0124"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 19422..19739 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0125"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 19740..20058 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0126"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 20059..20379 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0127"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 20380..20702 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0128"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 20703..21027 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0129"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 21028..21355 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012A"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 21356..21685 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012B"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 21686..22018 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012C"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 22019..22355 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012D"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 22356..22695 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012E"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 22696..23040 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u012F"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 23041..23390 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0130"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 23391..23745 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0131"'

execute if score $game_state fetchr.state matches 0..1 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0100"'

# padding
scoreboard players set $custom_hud/width.padding fetchr.io 33
execute if score $hours 91.timer.time matches ..99 run scoreboard players add $custom_hud/width.padding fetchr.io 6
execute if score $hours 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding fetchr.io 6
execute if score $hours 91.timer.time matches 0 run scoreboard players add $custom_hud/width.padding fetchr.io 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding fetchr.io 6
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 run scoreboard players add $custom_hud/width.padding fetchr.io 8
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 if score $seconds 91.timer.time matches ..9 run scoreboard players add $custom_hud/width.padding fetchr.io 6

# hide timer during pre-gen
execute if score $game_state fetchr.state matches 0..2 run data modify storage io.fetchr:custom_hud component.textComponent set value '"0"'
execute if score $game_state fetchr.state matches 0..2 run scoreboard players set $custom_hud/width.padding fetchr.io 73

function fetchr:custom_hud/component_post_evaluation
data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:timer"}] merge from storage io.fetchr:custom_hud component