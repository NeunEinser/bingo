#> neun_einser.timer:internal/tick
#
# Function that is called every tick. Increases a tick counter used to prevent
# overdlows and reloads to mess up the timer
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

scoreboard players add $ticks 91.timer.intern 1