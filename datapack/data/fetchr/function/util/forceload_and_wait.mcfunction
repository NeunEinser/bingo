#> fetchr:util/forceload
#
# Forceloads a set of areas and executes the callback function
#
# @public
# @input
# 	storage io.fetchr:util forceload_coordinates
# 	storage io.fetchr:util callback

data modify storage tmp.fetchr:util forceload_queue append value {}

data \
	modify storage tmp.fetchr:util forceload_queue[-1].forceload_coordinates \
	set from storage io.fetchr:util forceload_coordinates
data \
	modify storage tmp.fetchr:util forceload_queue[-1].callback \
	set from storage io.fetchr:util callback

data \
	modify storage tmp.fetchr:util forceload_coordinates \
	set from storage io.fetchr:util forceload_coordinates
function fetchr:util/forceload/forceload_iter

data \
	modify storage tmp.fetchr:util forceload_coordinates \
	set from storage io.fetchr:util forceload_coordinates

function fetchr:util/forceload/check/schedule