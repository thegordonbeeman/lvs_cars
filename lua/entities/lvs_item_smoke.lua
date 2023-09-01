AddCSLuaFile()

ENT.Type            = "anim"

ENT.PrintName = "Smoke"
ENT.Author = "Luna"
ENT.Category = "[LVS] - Cars - Items"

ENT.Spawnable		= true
ENT.AdminOnly		= false

function ENT:SetupDataTables()
	self:NetworkVar( "Bool",0, "Active" )
end

ENT.LifeTime = 30

if SERVER then
	function ENT:SpawnFunction( ply, tr, ClassName )
		if not tr.Hit then return end

		local ent = ents.Create( ClassName )
		ent:SetPos( tr.HitPos + tr.HitNormal * 5 )
		ent:Spawn()
		ent:Activate()

		return ent
	end

	function ENT:Initialize()	
		self:SetModel( "models/Items/AR2_Grenade.mdl" )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
		self:SetCollisionGroup( COLLISION_GROUP_DEBRIS )

		self.TrailEntity = util.SpriteTrail( self, 0, Color(120,120,120,120), false, 5, 40, 0.2, 1 / ( 15 + 1 ) * 0.5, "trails/smoke" )
	end

	function ENT:Think()	
		local T = CurTime()

		self:NextThink( T + 1 )

		if not self.RemoveTime then return true end

		if self.RemoveTime < T then
			self:Remove()
		end

		return true
	end

	function ENT:PhysicsCollide( data, physobj )
		if not self:GetActive() then
			self.RemoveTime = CurTime() + self.LifeTime

			self:SetActive( true )

			self:EmitSound("weapons/flaregun/fire.wav", 65, 100, 0.5)

			if IsValid( self.TrailEntity ) then
				self.TrailEntity:Remove()
			end
		end

		if data.Speed > 60 and data.DeltaTime > 0.2 then
			local VelDif = data.OurOldVelocity:Length() - data.OurNewVelocity:Length()

			if VelDif > 200 then
				self:EmitSound( "Grenade.ImpactHard" )
			else
				self:EmitSound( "Grenade.ImpactSoft" )
			end

			physobj:SetVelocity( data.OurOldVelocity * 0.5 )
		end
	end
else
	function ENT:Draw()
		self:DrawModel()
	end

	function ENT:StartSound()
		if self.snd then return self.snd end

		self.snd = CreateSound( self, "weapons/flaregun/burn.wav" )
		self.snd:PlayEx(1,100)

		return self.snd
	end

	local Mins = Vector(-1,-1,-1) * 500
	local Maxs = Vector(1,1,1) * 500
	function ENT:Think()
		local T = CurTime()

		if not self:GetActive() then self.DieTime = T + self.LifeTime return end

		local volume = ((self.DieTime or 0) - T) / self.LifeTime
		local snd = self:StartSound()
		snd:ChangeVolume( volume, 0.5 )

		self.RemovedEnts = self.RemovedEnts or {}

		local plyPos = LocalPlayer():GetPos()
		local pos = self:GetPos()

		if (plyPos - pos):Length() < 1000 then
			for id, ent in pairs( LVS:GetVehicles() ) do
				LVS:GetVehicles()[ id ] = nil
				table.insert( self.RemovedEnts, ent )
			end
		else
			for id, ent in pairs( LVS:GetVehicles() ) do
				local pDelta = ent:GetPos() - plyPos
				local HitPos, HitNormal, Fraction = util.IntersectRayWithOBB( plyPos, pDelta, pos, angle_zero, Mins, Maxs )

				if HitPos then
					LVS:GetVehicles()[ id ] = nil

					table.insert( self.RemovedEnts, ent )
				end
			end

			for id, ent in pairs( self.RemovedEnts ) do
				if not IsValid( ent ) then 
					self.RemovedEnts[ id ] = nil

					continue
				end

				local pDelta = ent:GetPos() - plyPos
				local HitPos, HitNormal, Fraction = util.IntersectRayWithOBB( plyPos, pDelta, pos, angle_zero, Mins, Maxs )

				if not HitPos then
					self.RemovedEnts[ id ] = nil
					table.insert( LVS:GetVehicles(), ent )
				end
			end
		end

		local effectdata = EffectData()
			effectdata:SetOrigin( self:GetPos() )
		util.Effect( "lvs_defence_smoke", effectdata, true, true )

		self:SetNextClientThink( T + 0.2 )

		return true
	end

	function ENT:OnRemove()
		self.RemovedEnts = self.RemovedEnts or {}

		for id, ent in pairs( self.RemovedEnts ) do
			self.RemovedEnts[ id ] = nil

			if not IsValid( ent ) then 
				continue
			end

			table.insert( LVS:GetVehicles(), ent )
		end

		if not self.snd then return end

		self.snd:Stop()
		self.snd = nil
	end
end