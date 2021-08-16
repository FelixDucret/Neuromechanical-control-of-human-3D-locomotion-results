-- SCONE script for a high-jump measure.

function init( model )
	-- find the two feet
	r_foot = model:find_body( "calcn_r" )
	l_foot = model:find_body( "calcn_l" )

	-- global double that keeps track of the sum of the horizontal distance between the COM of the model and the middle point of the segment between the two feet
	sum_distance = 0
	distance = 0
	distance_x = 0
end

function update( model )
	-- get current lateral position
	local middle_point_x = (r_foot:com_pos().x + l_foot:com_pos().x) / 2
	local middle_point_z = (r_foot:com_pos().z + l_foot:com_pos().z) / 2

	distance_x = math.abs(middle_point_x - model:com_pos().x)
	local distance_z = math.abs(middle_point_z - model:com_pos().z)

	distance = math.sqrt(distance_x^2 + distance_z^2)

	local x_boundary = 0.2

	if distance_x > x_boundary then
		sum_distance = sum_distance + distance
	else
		sum_distance = sum_distance + distance_z
	end

    -- sum_distance = sum_distance + distance
    return false -- return false to keep going
end

function result( model )
	-- return the sum of deviations
	scone.debug("total_sum = " .. sum_distance)
	return sum_distance
end

function store_data( current_frame )
	current_frame:set_value("COM_midpoint_distance ", distance)
	current_frame:set_value("dist_x ", distance_x)
end