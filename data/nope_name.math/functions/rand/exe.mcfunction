##by NOPEname

#>
# @api
#declare score_holder $min
#>
# @api
#declare score_holder $max
#>
# @api
#declare score_holder $out
#>
# @internal
#declare score_holder $range

scoreboard players operation $range nn.math.rand = $max nn.math.rand
scoreboard players operation $range nn.math.rand -= $min nn.math.rand

function nope_name.math:zz_private/rand/next_int_lcg
scoreboard players operation $out nn.math.rand += $min nn.math.rand

###scoreboard players reset $tmp0 nn.math.rand
scoreboard players reset $max nn.math.rand
scoreboard players reset $min nn.math.rand

