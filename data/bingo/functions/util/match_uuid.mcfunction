#> bingo:util/match_uuid
#
# Tags @s with bingo.uuid if the uuid of that entity matches the input.
#
# @internal
# @input storage temp:bingo.input/uuid
# @output tag bingo.uuid_match
# @context entity Entity to check
#>
# @private
#declare score_holder $match_uuid.success

#>
# Output tag for bingo:util/match_uuid
# May only be set by that function
#
# @internal
#declare tag bingo.uuid_match
#>
# Input for bingo:util/match_uuid
# May only be read by that function
#
# @internal
#declare storage temp:bingo.input/uuid

execute store success score $match_uuid.success bingo.tmp run data modify storage temp:bingo.input/uuid uuid set from entity @s UUID

execute if score $match_uuid.success bingo.tmp matches 0 run tag @s add bingo.uuid_match