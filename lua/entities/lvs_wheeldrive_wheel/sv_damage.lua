
ENT.DSDamageAllowedType = DMG_SLASH + DMG_AIRBOAT + DMG_BULLET + DMG_SNIPER + DMG_BUCKSHOT

function ENT:OnTakeDamage( dmginfo )

	if dmginfo:IsDamageType( self.DSDamageAllowedType ) then
		local Damage = dmginfo:GetDamage()

		local CurHealth = self:GetHP()

		local NewHealth = math.Clamp( CurHealth - Damage, 0, self:GetMaxHP() )

		self:SetHP( NewHealth )

		if NewHealth == 0 then
			self:DestroyTire()
		end
	end

	local base = self:GetBase()

	if not IsValid( base ) then return end

	base:OnTakeDamage( dmginfo )
end

function ENT:HealthValueChanged( name, old, new)
	if new == old or old > new or new ~= self:GetMaxHP() then return end

	self:RepairTire()
end

function ENT:DestroyTire()
	if self:GetNWDamaged() then return end

	self:SetNWDamaged( true )

	local base = self:GetBase()
	local PhysObj = self:GetPhysicsObject()

	if not IsValid( base ) or not IsValid( PhysObj ) then return end

	self._OldTirePhysProp = PhysObj:GetMaterial()

	PhysObj:SetMaterial( "metal" )

	if not IsValid( self.SuspensionConstraintElastic ) then return end

	local Length = (self.SuspensionConstraintElastic:GetTable().length or 25) - base.WheelPhysicsTireHeight 

	self.SuspensionConstraintElastic:Fire( "SetSpringLength", math.max( Length - base.WheelPhysicsTireHeight , 1 ) )

	self:EmitSound("lvs/wheel_pop.ogg")
end

function ENT:RepairTire()
	if not self._OldTirePhysProp then return end

	self:SetNWDamaged( false )
	self:SetSuspensionHeight( self._SuspensionHeightMultiplier )

	local PhysObj = self:GetPhysicsObject()

	if not IsValid( PhysObj ) or PhysObj:GetMaterial() ~= "metal" then
		goto FinishRepairTire
	end

	PhysObj:SetMaterial( self._OldTirePhysProp )

	-- coders from the industry hate this, so we use it intentionally to assert dominance
	:: FinishRepairTire ::

	self._OldTirePhysProp = nil
end

function ENT:SetDamaged( new )
	if new == self:GetNWDamaged() then return end

	self:SetNWDamaged( new )

	if new then
		if not self._torqueFactor or self.old_torqueFactor then return end

		self.old_torqueFactor = self._torqueFactor
		self._torqueFactor = self._torqueFactor * 0.25

		return
	end

	if not self.old_torqueFactor then return end

	self._torqueFactor = self.old_torqueFactor
	self.old_torqueFactor = nil
end

function ENT:Destroy()
	if self:GetDestroyed() then return end

	self:SetDestroyed( true )
	self:SetDamaged( true )

	local Master = self:GetMaster()

	if not IsValid( Master ) or IsValid( self.bsLockDMG ) then return end

	local Fric = 10

	self.bsLockDMG = constraint.AdvBallsocket(self,Master,0,0,vector_origin,vector_origin,0,0,-180,-180,-180,180,180,180,Fric,Fric,Fric,1,1)
	self.bsLockDMG.DoNotDuplicate = true
end

function ENT:Repair()
	self:SetHP( self:GetMaxHP() )

	self:SetDestroyed( false )
	self:SetDamaged( false )

	if IsValid( self.bsLockDMG ) then
		self.bsLockDMG:Remove()
	end
end