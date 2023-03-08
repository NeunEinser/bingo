#> fetchr:game/start/init_teams/dark_aqua
#
# Initializes the dark aqua team
#
# @within function fetchr:game/start/init_teams

data modify block 7 0 7 Text1 set value '[{"storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "dark_aqua"}, {"text": "\\uffeb", "font": "fetchr:space"}]'
data modify storage fetchr:card teams[{id: "fetchr:dark_aqua"}].background set from block 7 0 7 Text1
data modify block 7 0 7 Text1 set value '[{"storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "#8b8b8b"}, {"text": "\\uffeb", "font": "fetchr:space"}]'
data modify storage tmp.fetchr:game/start defaultBackground append from block 7 0 7 Text1

data remove storage tmp.fetchr:game/start backgroundTemplate[0]