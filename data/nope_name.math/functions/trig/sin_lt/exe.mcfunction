##by NOPEname


#input:
# 		format:		scoreboard
#		objective: 	nn.math.trig
#		name: 		in
#		format:		angle in degrees	(example: set 1 for 1° )

#use:				<this>
#preserves input: 	no	(values $outside [0..360] will be wrapped into $range)

#$output:
#		format: 	scoreboard
#		objective: 	nn.math.trig
#		name: 		$out
#		format:		scaled by *1000000000	([0..1] -> [0..1000000000])
#		accuracy:	best possible result

#additional information:
#		methode used: lookup table

#>
# @api
#declare score_holder $out
#>
# @api
#declare score_holder $in
#>
# @private
#declare score_holder $tmp

scoreboard players operation $in nn.math.trig %= 360 nn.math.trig
scoreboard players operation $tmp nn.math.trig = $in nn.math.trig
scoreboard players operation $tmp nn.math.trig %= 180 nn.math.trig
function nope_name.math:zz_private/trig/sin_lt/lookup
execute if score $in nn.math.trig matches 181..360 run scoreboard players operation $out nn.math.trig *= -1 nn.math.trig