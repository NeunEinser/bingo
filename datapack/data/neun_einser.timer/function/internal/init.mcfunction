#> neun_einser.timer:internal/init
#
# Declares scoreboard and storage 
#
# @handles #minecraft:load
# @within tag/function minecraft:load

#>
# Storage containing the time since start in some default formats
#
# Available are:
# hh:mm:ss.s (.s means fractions of a second, 1 - 3 digits depending on the value)
# hh:mm:ss
# hh:mm
#
# All of these are keys in this storage and contain a text component meant for
# use like this:
#
# { "storage": "neun_einser.timer:display", "nbt": "hh:mm:ss.s", "interpret":
# true }
#
# This accounts for appending 0s where neccesary and only contains components >
# 0.
#
# Examples hh:mm:ss might output:
# 1:02:03 (for 1h 2m 3s)
# 1:15:21 (for 1h 15m 21s)
# 1:00:00 (for 1h 0m 0s)
# 1:02 (for 1m 2s)
# 1 (for 1s)
#
# For hh:mm:ss.s, seconds is always set. Examples:
# 0.5 (for 0s, 500 millis)
# 0.023 (for 0s, 23 millis)
# 1:15.31 (for 1m 15s 310 millis)
#
# @api
#declare storage neun_einser.timer:display

#>
# This objective contains the current time.
#
# \$raw contains the raw time with the chosen percision (example: if the timer
# was started with start/seconds, this is the time in seconds since the start.)
#
# \$millis is between 0 and 999 and contains the millisecond part
#
# \$seconds is between 0 and 59 and contains the second part
#
# \$minutes is between 0 and 59 and contains the minute part
#
# \$hours is 0 or higher and contains the hour part.
#
# \$count_pauses is 0 or 1 and indicates whether game pauses should be counted
# towards the total time. You may write to this value. 0 by default, but is
# never reset, even when restarting the timer. Setting this in your init function
# once will work fine.
#
# @api
scoreboard objectives add 91.timer.io dummy
#>
# @internal
scoreboard objectives add 91.timer.unpaused_ticks minecraft.custom:minecraft.play_time
#>
# @internal
scoreboard objectives add 91.timer.total_ticks minecraft.custom:minecraft.total_world_time
#>
# This score holder contains the raw time with the selected percision.
#
# In particular this means:
# - Seconds since start, when having used neun_einser.timer:start/second
# - Deciseconds since start, when having used
#   neun_einser.timer:start/tenth_of_second
# - Centiseconds since start, when using
#   neun_einser.timer:start/hundreth_of_second
# - Milliseconds since start when having used neun_einser.timer:start/millis
#
# @api
#declare score_holder $raw
#>
# This score holder contains the millisecond part.
#
# This is always between 0 and 999 (inclusive)
#
# @api
#declare score_holder $millis
#>
# This score holder contains the second part.
#
# This is always between 0 and 59 (inclusive)
#
# @api
#declare score_holder $seconds
#>
# This score holder contains the minute part.
#
# This is always between 0 and 59 (inclusive)
#
# @api
#declare score_holder $minutes
#>
# This score holder contains the hour part.
#
# This score is uncapped.
#
# @api
#declare score_holder $hours
#>
# Whether game pauses should be counted towards the total time.
#
# This is never reset, even when restarting the timer. Setting this in your init
# function once will work fine.
#
# You may change this value at any point, even while the timer is running.
#
# 0 by default.
#
# A pause is:
# - The game being paused in single player
# - No player being present in multi player
#
# The server being shut down or the world being closed will never increment the
# timer, regardless of this value.
#
# @api
#declare score_holder $count_pauses
scoreboard players add $count_pauses 91.timer.io 0
#>
# The amount number of units per second which are counted. E.g. 1000 means
# miliseconds.
#
# For in-game time this value will be 20, otherwise it will be a power of 10.
#
# This value is read-only.
#
# @api
#declare score_holder $current_percision

#>
# Internal scoreboard for non-temporary memory
#
# @internal
scoreboard objectives add 91.timer.intern dummy

#>
# Scoreboard used for temporary variables
#
# @internal
scoreboard objectives add 91.timer.tmp dummy

#>
# @internal
#declare score_holder 60
scoreboard players set 60 91.timer.intern 60
#>
# @internal
#declare score_holder 20
scoreboard players set 20 91.timer.intern 20
#>
# @internal
#declare score_holder 5
scoreboard players set 5 91.timer.intern 5

#>
# Raw time the world border was started at. The worldborder typically starts at
# 50000000 and increases its size from there.
#
# Once the world border is about to hit the limit, it is reset to the starting
# position and this value is decreased accordingly and might be negative
# thereafter
#
# @internal
#declare score_holder $start
#>
# Wheter the current timer is in in-game time (0 or 1).
#
# @internal
#declare score_holder $in_game
#>
# Blocks the world border travels per second. Used for some internal
# calculations.
#
# For example, if this was started with neun_einser.timer:start/millis, this
# will be 1000.
#
# @internal
#declare score_holder $blocks_per_second
#>
# Ticks that have passed since last call of read_raw
#
# @internal
#declare score_holder $ticks
#>
# The distance the world border had during the last tick read_raw was called.
#
# @internal
#declare score_holder $last_worldborder_value

#NEUN_SCRIPT until 65
#data merge storage neun_einser.timer:display {\
	"hh:mm:ss.s": '[\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.hours", "interpret": true },\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.minutes", "interpret": true },\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.seconds", "interpret": true },\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.millis", "interpret": true }\
	]',\
	"hh:mm:ss": '[\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.hours", "interpret": true },\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.minutes", "interpret": true },\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.seconds", "interpret": true }\
	]',\
	"hh:mm": '[\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.hours", "interpret": true },\
		{ "storage": "neun_einser.timer:display", "nbt": "internal.minutes", "interpret": true }\
	]'\
}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data merge storage neun_einser.timer:display {\
	"hh:mm:ss.s": [\
		{ storage: "neun_einser.timer:display", nbt: "internal.hours", interpret: true },\
		{ storage: "neun_einser.timer:display", nbt: "internal.minutes", interpret: true },\
		{ storage: "neun_einser.timer:display", nbt: "internal.seconds", interpret: true },\
		{ storage: "neun_einser.timer:display", nbt: "internal.millis", interpret: true }\
	],\
	"hh:mm:ss": [\
		{ storage: "neun_einser.timer:display", nbt: "internal.hours", interpret: true },\
		{ storage: "neun_einser.timer:display", nbt: "internal.minutes", interpret: true },\
		{ storage: "neun_einser.timer:display", nbt: "internal.seconds", interpret: true }\
	],\
	"hh:mm": [\
		{ storage: "neun_einser.timer:display", nbt: "internal.hours", interpret: true },\
		{ storage: "neun_einser.timer:display", nbt: "internal.minutes", interpret: true }\
	]\
}
#NEUN_SCRIPT end