#> fetchr:util/match_uuid
#
# Tags @s with fetchr.uuid if the uuid of that entity matches the input.
#
# @internal
# @input storage tmp.fetchr:uuid
# @output tag fetchr.uuid_match
# @context entity Entity to check
#>
# @private
#declare score_holder $match_uuid.success

#>
# Output tag for fetchr:util/match_uuid
# May only be set by that function
#
# @internal
#declare tag fetchr.uuid_match
#>
# Input for fetchr:util/match_uuid
# May only be read by that function
#
# @internal
#declare storage tmp.fetchr:uuid

execute store success score $match_uuid.success fetchr.tmp run data modify storage tmp.fetchr:uuid uuid set from entity @s UUID

execute if score $match_uuid.success fetchr.tmp matches 0 run tag @s add fetchr.uuid_match