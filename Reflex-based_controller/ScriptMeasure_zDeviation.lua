-- SCONE script for a high-jump measure.

function init( model )
	-- get the 'target_body' parameter from ScriptMeasure, or set to "pelvis"
	target_body = scone.target_body or "pelvis"

	-- find the actual body with the same name
	body = model:find_body( target_body )

	-- global double that keeps track of the sum of deviations on the z-axis
	sum_zDeviation = 0
    init_z = body:com_pos().z
end

function update( model )
	-- get current lateral position
	local deviation = math.abs(body:com_pos().z - init_z)
    -- check if we deviated too much from the initial position
	if deviation > 0.05 then
        -- if that is the case we add the deviation at this step with all the other deviations at other steps
        sum_zDeviation = sum_zDeviation + deviation
    end
	return false -- return false to keep going
end

function result( model )
	-- return the sum of deviations
	scone.debug("total_sum = " .. sum_zDeviation)
	return sum_zDeviation
end
