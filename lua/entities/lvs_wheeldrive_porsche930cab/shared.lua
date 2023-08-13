
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Porsche 911 Cabriolet"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/porsche_930/cab.mdl"

ENT.MaxVelocity = 2100

ENT.EnginePower = 4000
ENT.EngineTorque = 100

ENT.TransGears = 5
ENT.TransGearsReverse = 1
ENT.TransMinGearHoldTime = 1
ENT.TransShiftSpeed = 0.3

ENT.PhysicsMass = 700
ENT.PhysicsInertia = Vector(1050,1050,525)

ENT.WheelPhysicsMass = 150
ENT.WheelPhysicsInertia = Vector(15,12,15)

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/ferrari_365/eng_idle_loop.wav",
		Volume = 1,
		Pitch = 70,
		PitchMul = 30,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/ferrari_365/eng_loop.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 110,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/ferrari_365/eng_revdown_loop.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 110,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
		UseDoppler = true,
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		SubMaterialID = 22,
		Sprites = {
			{ pos = Vector(-79.87,18.54,19.11), colorG = 0, colorB = 0, colorA = 150 },
			{ pos = Vector(-79.87,-18.54,19.11), colorG = 0, colorB = 0, colorA = 150 },
		},
		ProjectedTextures = {
			{ pos = Vector(70.35,24.27,25.07), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(70.35,-24.27,25.07), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{ pos = Vector(70.35,24.27,25.07), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
			{ pos = Vector(70.35,-24.27,25.07), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true },
		},
	},
	{
		Trigger = "main+high",
		--SubMaterialID = 22,
		Sprites = {
			{ pos = Vector(70.35,24.27,25.07), colorB = 200, colorA = 150 },
			{ pos = Vector(70.35,-24.27,25.07), colorB = 200, colorA = 150 },
		},
	},
	{
		Trigger = "brake",
		SubMaterialID = 25,
		Sprites = {
			{ pos = Vector(-78.67,-14.75,18.92), colorG = 0, colorB = 0, colorA = 150 },
			{ pos = Vector(-78.67,14.75,18.92), colorG = 0, colorB = 0, colorA = 150 },
		}
	},
	{
		Trigger = "reverse",
		SubMaterialID = 26,
		Sprites = {
			{ pos = Vector(-77.8,-21.08,19.08), height = 25, width = 25, colorA = 150 },
			{ pos = Vector(-77.8,21.08,19.08), height = 25, width = 25, colorA = 150 },
		}
	},
		{
		Trigger = "turnright",
		SubMaterialID = 18,
		Sprites = {
			{ width = 35, height = 35, pos = Vector(80.31,-24.86,16.22), colorG = 100, colorB = 0, colorA = 150 },
			{ width = 40, height = 40, pos = Vector(-76.48,-24.44,19.07), colorG = 100, colorB = 0, colorA = 150 },
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 20,
		Sprites = {
			{ width = 35, height = 35, pos = Vector(80.31,24.86,16.22), colorG = 100, colorB = 0, colorA = 50 },
			{ width = 40, height = 40, pos = Vector(-76.48,24.44,19.07), colorG = 100, colorB = 0, colorA = 150 },
		},
	},
	{
		Trigger = "fog",
		SubMaterialID = 24,
		Sprites = {
			{ pos = Vector(79.04,19.43,11.04), colorB = 200, colorA = 150 },
			{ pos = Vector(79.04,-19.43,11.04), colorB = 200,colorA = 150 },
		},
	},
}

