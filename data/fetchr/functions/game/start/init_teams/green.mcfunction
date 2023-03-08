#> fetchr:game/start/init_teams/green
#
# Initializes the green team
#
# @within function fetchr:game/start/init_teams

data modify block 7 0 7 Text1 set value '[{"storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "green"}, {"text": "\\uffeb", "font": "fetchr:space"}]'
data modify storage fetchr:card teams[{id: "fetchr:green"}].background set from block 7 0 7 Text1
data modify block 7 0 7 Text1 set value '[{"storage": "tmp.fetchr:game/start", "nbt": "backgroundTemplate[0]", "interpret": true, "color": "#8b8b8b"}, {"text": "\\uffeb", "font": "fetchr:space"}]'
data modify storage tmp.fetchr:game/start defaultBackground append from block 7 0 7 Text1

data remove storage tmp.fetchr:game/start backgroundTemplate[0]