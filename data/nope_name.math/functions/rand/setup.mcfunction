##by NOPEname

scoreboard objectives add nn.math.rand dummy

#>
# @internal
#declare score_holder 2
scoreboard players set 2 nn.math.rand 2

#>
# @internal
#declare score_holder $lcg
scoreboard players set $lcg nn.math.rand 1103515245
#>
# @internal
#declare score_holder 100000000
scoreboard players set 100000000 nn.math.rand 100000000