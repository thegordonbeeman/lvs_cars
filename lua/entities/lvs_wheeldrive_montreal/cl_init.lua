include("shared.lua")

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear )
	self:SetPoseParameter( "vehicle_steer", steer )
	self:SetPoseParameter( "tacho_gauge", engine_rpm / 9000 )
	self:SetPoseParameter( "vehicle_gauge", speed_kmh / 210 )
	self:SetPoseParameter( "throttle_pedal", throttle )
	self:SetPoseParameter( "brake_pedal", brake )
	self:SetPoseParameter( "handbrake_pedal", handbrake )
	self:SetPoseParameter( "clutch_pedal", clutch )

	local GearIDtoPose = {
		[-1] = 0,
		[1] = 2,
		[2] = 5,
		[3] = 7,
		[4] = 10,
		[5] = 12,
	}

	self:SetPoseParameter( "gear",  self:QuickLerp( "gear", (GearIDtoPose[ gear ] or 1) ) )
end