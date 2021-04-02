#> bingo:card_display/display_card
#
# Displays the bingo card for @s
#
# @internal
# @context entity Player for displaying the card
# @reads score @s bingo.card_pos

#>
# The y coordinate of the current player
#
# @private
#declare score_holder $card_display/display_card.y

function bingo:util/find_player_team
execute in bingo:lobby run function neun_einser.timer:store_current_time

scoreboard players enable @s bingo.card_pos

# text
execute store result score $card_display/display_card.y bingo.tmp run data get entity @s Pos[1]
data modify storage bingo:tmp y set value '{"score": {"name": "$card_display/display_card.y", "objective": "bingo.tmp"}}'
execute if entity @s[tag=bingo.emerald] run data modify storage bingo:tmp y set value '{"score": {"name": "$card_display/display_card.y", "objective": "bingo.tmp"}, "color": "green"}'

data modify storage bingo:tmp ySpaces set value [""]

#Characters are \uF826. Has to be literal character in this case. Space width 6.
execute if score $card_display/display_card.y bingo.tmp matches 0..99 run data modify storage bingo:tmp ySpaces append value ""
execute if score $card_display/display_card.y bingo.tmp matches 0..9 run data modify storage bingo:tmp ySpaces append value ""
execute if score $card_display/display_card.y bingo.tmp matches -9..-1 run data modify storage bingo:tmp ySpaces append value ""

data modify storage bingo:tmp timeSpaces set value []

#Characters are \uF826. Has to be literal character in this case. Space width 6.
execute if score $hours 91.timer.time matches ..99 run data modify storage bingo:tmp timeSpaces append value ""
execute if score $hours 91.timer.time matches ..9 run data modify storage bingo:tmp timeSpaces append value ""
#Character is \uF828. Has to be literal character in this case. Space width 8.
execute if score $hours 91.timer.time matches 0 run data modify storage bingo:tmp timeSpaces append value ""
#Character is \uF826. Has to be literal character in this case. Space width 6.
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches ..9 run data modify storage bingo:tmp timeSpaces append value ""
#Character is \uF828. Has to be literal character in this case. Space width 8.
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 run data modify storage bingo:tmp timeSpaces append value ""
#Character is \uF826. Has to be literal character in this case. Space width 6.
execute if score $hours 91.timer.time matches 0 if score $minutes 91.timer.time matches 0 if score $seconds 91.timer.time matches ..9 run data modify storage bingo:tmp timeSpaces append value ""

scoreboard players operation $card_display/width.number bingo.tmp = $seed bingo.state
scoreboard players set $card_display/width.width bingo.tmp 86
function bingo:card_display/get_width

data modify storage bingo:tmp seedSpaces set value [""]
function bingo:card_display/calculate_seed_spaces

# card
execute if score @s bingo.card_pos matches ..7 run function bingo:card_display/left
execute if score @s bingo.card_pos matches 8.. run function bingo:card_display/right

execute if data storage bingo:card slots run data modify storage bingo:tmp card set value '[{"storage":"bingo:tmp","nbt":"cardOffset","interpret":true},{"text":"a","font":"bingo:card"},{"translate":"space.-103"},{"storage":"bingo:card","nbt":"slots[0].item.icon","interpret":true,"font":"bingo:row0"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[1].item.icon","interpret":true,"font":"bingo:row0"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[2].item.icon","interpret":true,"font":"bingo:row0"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[3].item.icon","interpret":true,"font":"bingo:row0"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[4].item.icon","interpret":true,"font":"bingo:row0"},{"translate":"space.-101"},{"storage":"bingo:card","nbt":"slots[5].item.icon","interpret":true,"font":"bingo:row1"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[6].item.icon","interpret":true,"font":"bingo:row1"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[7].item.icon","interpret":true,"font":"bingo:row1"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[8].item.icon","interpret":true,"font":"bingo:row1"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[9].item.icon","interpret":true,"font":"bingo:row1"},{"translate":"space.-101"},{"storage":"bingo:card","nbt":"slots[10].item.icon","interpret":true,"font":"bingo:row2"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[11].item.icon","interpret":true,"font":"bingo:row2"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[12].item.icon","interpret":true,"font":"bingo:row2"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[13].item.icon","interpret":true,"font":"bingo:row2"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[14].item.icon","interpret":true,"font":"bingo:row2"},{"translate":"space.-101"},{"storage":"bingo:card","nbt":"slots[15].item.icon","interpret":true,"font":"bingo:row3"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[16].item.icon","interpret":true,"font":"bingo:row3"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[17].item.icon","interpret":true,"font":"bingo:row3"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[18].item.icon","interpret":true,"font":"bingo:row3"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[19].item.icon","interpret":true,"font":"bingo:row3"},{"translate":"space.-101"},{"storage":"bingo:card","nbt":"slots[20].item.icon","interpret":true,"font":"bingo:row4"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[21].item.icon","interpret":true,"font":"bingo:row4"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[22].item.icon","interpret":true,"font":"bingo:row4"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[23].item.icon","interpret":true,"font":"bingo:row4"},{"translate":"space.4"},{"storage":"bingo:card","nbt":"slots[24].item.icon","interpret":true,"font":"bingo:row4"},{"translate":"space.-103"},{"storage":"bingo:card","nbt":"teams[-1].slots[0]","interpret":true,"font":"bingo:row0"},{"storage":"bingo:card","nbt":"teams[-1].slots[1]","interpret":true,"font":"bingo:row0"},{"storage":"bingo:card","nbt":"teams[-1].slots[2]","interpret":true,"font":"bingo:row0"},{"storage":"bingo:card","nbt":"teams[-1].slots[3]","interpret":true,"font":"bingo:row0"},{"storage":"bingo:card","nbt":"teams[-1].slots[4]","interpret":true,"font":"bingo:row0"},{"translate":"space.-105"},{"storage":"bingo:card","nbt":"teams[-1].slots[5]","interpret":true,"font":"bingo:row1"},{"storage":"bingo:card","nbt":"teams[-1].slots[6]","interpret":true,"font":"bingo:row1"},{"storage":"bingo:card","nbt":"teams[-1].slots[7]","interpret":true,"font":"bingo:row1"},{"storage":"bingo:card","nbt":"teams[-1].slots[8]","interpret":true,"font":"bingo:row1"},{"storage":"bingo:card","nbt":"teams[-1].slots[9]","interpret":true,"font":"bingo:row1"},{"translate":"space.-105"},{"storage":"bingo:card","nbt":"teams[-1].slots[10]","interpret":true,"font":"bingo:row2"},{"storage":"bingo:card","nbt":"teams[-1].slots[11]","interpret":true,"font":"bingo:row2"},{"storage":"bingo:card","nbt":"teams[-1].slots[12]","interpret":true,"font":"bingo:row2"},{"storage":"bingo:card","nbt":"teams[-1].slots[13]","interpret":true,"font":"bingo:row2"},{"storage":"bingo:card","nbt":"teams[-1].slots[14]","interpret":true,"font":"bingo:row2"},{"translate":"space.-105"},{"storage":"bingo:card","nbt":"teams[-1].slots[15]","interpret":true,"font":"bingo:row3"},{"storage":"bingo:card","nbt":"teams[-1].slots[16]","interpret":true,"font":"bingo:row3"},{"storage":"bingo:card","nbt":"teams[-1].slots[17]","interpret":true,"font":"bingo:row3"},{"storage":"bingo:card","nbt":"teams[-1].slots[18]","interpret":true,"font":"bingo:row3"},{"storage":"bingo:card","nbt":"teams[-1].slots[19]","interpret":true,"font":"bingo:row3"},{"translate":"space.-105"},{"storage":"bingo:card","nbt":"teams[-1].slots[20]","interpret":true,"font":"bingo:row4"},{"storage":"bingo:card","nbt":"teams[-1].slots[21]","interpret":true,"font":"bingo:row4"},{"storage":"bingo:card","nbt":"teams[-1].slots[22]","interpret":true,"font":"bingo:row4"},{"storage":"bingo:card","nbt":"teams[-1].slots[23]","interpret":true,"font":"bingo:row4"},{"storage":"bingo:card","nbt":"teams[-1].slots[24]","interpret":true,"font":"bingo:row4"},{"translate":"space.-105"},{"storage":"bingo:tmp", "nbt": "cardNegOffset", "interpret": true}]'

title @s actionbar [{"translate":"space.46"},{"storage":"bingo:tmp","nbt":"timeSpaces","interpret":true},{"storage":"neun_einser.timer:display","nbt":"hh:mm:ss","interpret":true,"font":"bingo:line1_shadow","color":"black"},{"translate":"space.-47"},{"storage":"bingo:tmp","nbt":"timeSpaces","interpret":true},{"storage":"neun_einser.timer:display","nbt":"hh:mm:ss","interpret":true,"font":"bingo:line1"},{"translate":"space.-29"},{"storage":"bingo:tmp","nbt":"ySpaces","interpret":true},{"text":"Y: ","font":"bingo:line2_shadow","color":"black","extra":[{"score":{"objective":"bingo.tmp","name":"$card_display/display_card.y"}}]},{"translate":"space.-31"},{"storage":"bingo:tmp","nbt":"ySpaces","interpret":true},{"text":"Y: ","font":"bingo:line2","extra":[{"storage": "bingo:tmp", "nbt": "y", "interpret": true}]},{"translate":"space.-91"},{"storage": "bingo:tmp", "nbt": "seedSpaces", "interpret": true},{"text": ": ", "font": "bingo:line3_shadow", "color": "black", "extra": [{"score":{"objective":"bingo.state","name":"$seed"}}]},{"translate":"space.-104"},{"storage": "bingo:tmp", "nbt": "seedSpaces", "interpret": true},{"text": "s", "font": "bingo:seed"}, {"text": ": ", "font": "bingo:line3", "extra": [{"score":{"objective":"bingo.state","name":"$seed"}}]},{"translate":"space.-91"},{"storage": "bingo:tmp", "nbt": "card", "interpret": true}]