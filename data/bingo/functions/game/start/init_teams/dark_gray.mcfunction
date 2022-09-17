#> bingo:game/start/init_teams/dark_gray
#
# Initializes the dark gray team
#
# @within function bingo:game/start/init_teams

data modify block 7 0 7 Text1 set value '[{"storage": "tmp.bingo:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "dark_gray"}, {"translate": "space.-21", "font": "space:default"}]'
data modify storage bingo:card teams[{id: "bingo:dark_gray"}].background set from block 7 0 7 Text1
data modify block 7 0 7 Text1 set value '[{"storage": "tmp.bingo:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "#8b8b8b"}, {"translate": "space.-21", "font": "space:default"}]'
data modify storage tmp.bingo:game/start defaultBackground append from block 7 0 7 Text1

data remove storage tmp.bingo:game/start backgroundTemplate[0]