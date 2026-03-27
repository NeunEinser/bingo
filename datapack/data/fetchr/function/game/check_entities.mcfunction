
data modify storage tmp.fetchr:game uuid set from storage tmp.fetchr:game uuids[-1]
data remove storage tmp.fetchr:game uuids[-1]

function fetchr:game/check_entity_macro with storage tmp.fetchr:game

execute if data storage tmp.fetchr:game uuids[0] run function fetchr:game/check_entities