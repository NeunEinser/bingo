
execute \
	store result score $track_uuid.uuid_part fetchr.tmp \
	run data get entity @s UUID[3]

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid second int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid second set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid second set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid second set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid second set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid second set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid second set value "f"

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

execute \
	store result score $track_uuid.uuid_part fetchr.tmp \
	run data get entity @s UUID[2]

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string
data modify storage tmp.fetchr:track_uuid first set value "-"
function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string
data modify storage tmp.fetchr:track_uuid first set value "-"
function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

execute \
	store result score $track_uuid.uuid_part fetchr.tmp \
	run data get entity @s UUID[1]

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string
data modify storage tmp.fetchr:track_uuid first set value "-"
function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string
data modify storage tmp.fetchr:track_uuid first set value "-"
function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

execute \
	store result score $track_uuid.uuid_part fetchr.tmp \
	run data get entity @s UUID[0]

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage tmp.fetchr:track_uuid second set from storage io.fetchr:util string

scoreboard players operation $track_uuid.hex_digit fetchr.tmp = $track_uuid.uuid_part fetchr.tmp
scoreboard players operation $track_uuid.hex_digit fetchr.tmp %= 16 fetchr.const
scoreboard players operation $track_uuid.uuid_part fetchr.tmp /= 16 fetchr.const

execute \
	store result storage tmp.fetchr:track_uuid first int 1 \
	run scoreboard players get $track_uuid.hex_digit fetchr.tmp
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 10 \
	run data modify storage tmp.fetchr:track_uuid first set value "a"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 11 \
	run data modify storage tmp.fetchr:track_uuid first set value "b"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 12 \
	run data modify storage tmp.fetchr:track_uuid first set value "c"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 13 \
	run data modify storage tmp.fetchr:track_uuid first set value "d"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 14 \
	run data modify storage tmp.fetchr:track_uuid first set value "e"
execute \
	if score $track_uuid.hex_digit fetchr.tmp matches 15 \
	run data modify storage tmp.fetchr:track_uuid first set value "f"

function fetchr:util/string/concat_escaped with storage tmp.fetchr:track_uuid
data modify storage fetchr:track_uuid uuids append from storage io.fetchr:util string

tag @s add fetchr.tracked