
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "BMW E9"
ENT.Author = "Digger"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/diggercars/bmw_e9/bmw_e9.mdl"

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
		SubMaterialID = 14,
		Sprites = {
			[1] = {
				pos = Vector(82.75,-25.26,15.61),
				colorB = 200,
				colorA = 150,
			},
			[2] = {
				pos = Vector(82.75,25.26,15.61),
				colorB = 200,
				colorA = 150,
			},
			[3] = {
				pos = Vector(-89.02,-19.56,15.72),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
			[4] = {
				pos = Vector(-89.02,19.56,15.72),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
		},
		ProjectedTextures = {
			[1] = {
				pos = Vector(82.75,-25.26,15.61),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
			[2] = {
				pos = Vector(82.75,25.26,15.61),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
		},
	},
	{
		Trigger = "high",
		SubMaterialID = 16,
		Sprites = {
			[1] = {
				pos = Vector(85.65,-18.09,15.71),
				colorB = 200,
				colorA = 150,
			},
			[2] = {
				pos = Vector(85.65,18.09,15.71),
				colorB = 200,
				colorA = 150,
			},
		},
		ProjectedTextures = {
			[1] = {
				pos = Vector(85.65,-18.09,15.71),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
			[2] = {
				pos = Vector(85.65,18.09,15.71),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
		},
	},
	{
		Trigger = "brake",
		SubMaterialID = 9,
		Sprites = {
			[1] = {
				pos = Vector(-89.85,10.48,15.56),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
		}
	},
	{
		Trigger = "reverse",
		SubMaterialID = 12,
		Sprites = {
			[1] = {
				pos = Vector(-89.59,-14.54,15.57),
				height = 25,
				width = 25,
				colorA = 150,
			},
			[2] = {
				pos = Vector(-89.59,14.54,15.57),
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
				pos = Vector(79.81,-31.54,16.82),
				colorG = 100,
				colorB = 0,
				colorA = 150,
			},
			[2] = {
				width = 40,
				height = 40,
				pos = Vector(-88.01,-25.58,15.79),
				colorG = 100,
				colorB = 0,
				colorA = 150,
			},
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = 11,
		Sprites = {
			[1] = {
				width = 35,
				height = 35,
				pos = Vector(79.81,31.54,16.82),
				colorG = 100,
				colorB = 0,
				colorA = 50,
			},
			[2] = {
				width = 40,
				height = 40,
				pos = Vector(-88.01,25.58,15.79),
				colorG = 100,
				colorB = 0,
				colorA = 150,
			},
		},
	},
}
