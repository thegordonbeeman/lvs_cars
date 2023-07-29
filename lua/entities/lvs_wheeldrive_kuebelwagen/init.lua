AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	PObj:SetMass( 1000 )

	self:AddDriverSeat( Vector(-8,13.75,16.25), Angle(0,-95,-8) )
	self:AddPassengerSeat( Vector(10,-13.75,20), Angle(0,-85,8) )

	self:AddEngine( Vector(-56.25,0,37.5) )

	local WheelModel = "models/diggercars/kubel/kubelwagen_wheel.mdl"
	local WheelRadius = 16.25

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
		},
		Wheels = {
			self:AddWheel( Vector(53,-23,17), Angle(0,90,0), WheelModel, WheelRadius ),
			self:AddWheel( Vector(53,23,17), Angle(0,-90,0), WheelModel, WheelRadius ),
		},
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 3500,
			SpringRelativeDamping = 3500,
		},
	} )

	local RearAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,0,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 1,
			BrakeFactor = 1,
		},
		Wheels = {
			self:AddWheel( Vector(-46.5,-25,17), Angle(0,90,0), WheelModel, WheelRadius ),
			self:AddWheel( Vector(-46.5,25,17), Angle(0,-90,0), WheelModel, WheelRadius ),
		},
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 25,
			SpringConstant = 20000,
			SpringDamping = 3500,
			SpringRelativeDamping = 3500,
		},
	} )
end

function ENT:OnEngineActiveChanged( Active )
	if Active then
		self:EmitSound( "lvs/vehicles/kuebelwagen/engine_start.wav" )
	else
		self:EmitSound( "lvs/vehicles/kuebelwagen/engine_stop.wav" )
	end
end