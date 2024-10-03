#> neun_einser.timer:internal/tick
#
# Function that is called every tick. Increases a tick counter used to prevent
# overdlows and reloads to mess up the timer
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

execute if score $in_game 91.timer.intern matches 1 if score $count_pauses 91.timer.io matches 1 unless entity @a[limit=1] run scoreboard players add $ticks 91.timer.intern 1