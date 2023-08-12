
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Alfa Romeo Montreal"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/alfa_montreal/montreal.mdl"

ENT.MaxVelocity = 2600

ENT.EnginePower = 1800
ENT.EngineTorque = 100

ENT.TransGears = 4
ENT.TransGearsReverse = 1
ENT.TransMinGearHoldTime = 1
ENT.TransShiftSpeed = 0.3

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/dodge_charger/engine_00791.wav",
		Volume = 1,
		Pitch = 85,
		PitchMul = 25,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/dodge_charger/engine_02021.wav",
		Volume = 1,
		Pitch = 80,
		PitchMul = 90,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_REV_UP,
		UseDoppler = true,
	},
	{
		sound = "lvs/vehicles/dodge_charger/engine_01835.wav",
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
		SubMaterialID = 15,
		Sprites = {
			[1] = {
				pos = Vector(82.14,17.08,23.37),
				colorB = 200,
				colorA = 150,
			},
			[2] = {
				pos = Vector(82.14,-17.08,23.37),
				colorB = 200,
				colorA = 150,
			},
			[3] = {
				pos = Vector(-90.42,16.84,27.36),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
			[4] = {
				pos = Vector(-90.42,-16.84,27.36),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
		},
		ProjectedTextures = {
			[1] = {
				pos = Vector(80.35,24.27,25.07),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
			[2] = {
				pos = Vector(80.35,-24.27,25.07),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
		},
	},
	{
		Trigger = "brake",
		SubMaterialID = 24,
		Sprites = {
			[1] = {
				pos = Vector(-90.1,23.75,26.99),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
			[2] = {
				pos = Vector(-90.1,-23.75,26.99),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
		}
	},
	{
		Trigger = "reverse",
		SubMaterialID = 25,
		Sprites = {
			[1] = {
				pos = Vector(-90.46,15.6,24.87),
				height = 25,
				width = 25,
				colorA = 150,
			},
			[2] = {
				pos = Vector(-90.46,-15.6,24.87),
				height = 25,
				width = 25,
				colorA = 150,
			},
		}
	},
	{
		Trigger = "turnright",
		SubMaterialID = 13,
		Sprites = {
			[1] = {
				width = 35,
				height = 35,
				pos = Vector(63.99,-34.41,25.48),
				colorG = 100,
				colorB = 0,
				colorA = 150,
			},
			[2] = {
				width = 40,
				height = 40,
				pos = Vector(-90.01,-23.25,24.85),
				colorG = 100,
				colorB = 0,
				colorA = 150,
			},
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 12,
		Sprites = {
			[1] = {
				width = 35,
				height = 35,
				pos = Vector(63.99,34.41,25.48),
				colorG = 100,
				colorB = 0,
				colorA = 50,
			},
			[2] = {
				width = 40,
				height = 40,
				pos = Vector(-90.01,23.25,24.85),
				colorG = 100,
				colorB = 0,
				colorA = 150,
			},
		},
	},
}