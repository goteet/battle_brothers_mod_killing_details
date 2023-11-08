this.battling_stats <- this.inherit("scripts/skills/skill", {
	m = 
	{
		DamageDealtHitpoints = 0,
		DamageDealtArmor = 0,
		MeleeAttack = 0,
		MeleeLanded = 0,
		RangeAttack = 0,
		RangeLanded = 0,

		DamageReceiveHitpoints = 0,
		DamageReceiveArmor = 0,
		BeingMeleeAttack = 0,
		BeingMeleeLanded = 0,
		BeingRangeAttack = 0,
		BeingRangeLanded = 0,

		ExecutionerPerkAttack = 0,
		ExecutionerPerkLanded = 0,
	},
	function create()
	{
		this.m.ID = "special.battling_stats";
		this.m.Name = "Battling Details";
		this.m.Description = "The Killing Detail Counter";
		this.m.Icon = "ui/backgrounds/background_20.png";
		this.m.IconMini = "";
		this.m.Order = this.Const.SkillOrder.Trait + 602;
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.IsActive = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			}
		];

		ret.push({ id = 10, type = "description", text = "Damage Dealt(HP/Armor)=" + this.m.DamageDealtHitpoints + "/" + this.m.DamageDealtArmor});

		ret.push({ id = 20, type = "description", text = "Melee Attack=" + this.m.MeleeAttack});
		ret.push({ 
			id = 21,
			type = "description",
			text = "Melee Landed=" + this.m.MeleeLanded 
				+ ", Melee Hit Rate=" 
				+ this.Math.round(100 * (this.m.MeleeLanded * 1.0 / this.m.MeleeAttack)) 
				+ "%"
		});

		ret.push({ id = 20, type = "description", text = "Ranged Attack=" + this.m.RangeAttack});
		ret.push({ 
			id = 21,
			type = "description",
			text = "Ranged Landed=" + this.m.RangeLanded 
				+ ", Ranged Hit Rate=" 
				+ this.Math.round(100 * (this.m.RangeLanded * 1.0 / this.m.RangeAttack)) 
				+ "%"
		});

		ret.push({ id = 11, type = "description", text = "Damage Receive(HP/Armor)=" + this.m.DamageReceiveHitpoints + "/" + this.m.DamageReceiveArmor});
		ret.push({
			id = 23,
			type = "description", 
			text = "Being Hit=" + this.m.BeingMeleeLanded 
				+ ", Melee Dodge Rate=" 
				+ this.Math.round(100 * (1.0 - this.m.BeingMeleeLanded * 1.0 / this.m.BeingMeleeAttack)) 
				+ "%"
		});
		ret.push({
			id = 24,
			type = "description", 
			text = "Being Shot=" + this.m.BeingRangeLanded 
				+ ", Ranged Dodge Rate=" 
				+ this.Math.round(100 * (1.0 - this.m.BeingRangeLanded * 1.0 / this.m.BeingRangeLanded)) 
				+ "%"
		});

		if(this.m.ExecutionerPerkLanded > 0 || this.m.ExecutionerPerkAttack > 0)
		{
			ret.push({
				id = 22,
				type = "description", 
				text = "Executioner=" + this.m.ExecutionerPerkLanded
					+ ", Effective Rate=" 
					+ this.Math.round(100 * (this.m.ExecutionerPerkLanded * 1.0 / this.m.ExecutionerPerkAttack)) 
					+ "%"
			});
		}
		return ret;
	}

	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		if(_skill.m.IsAttack && _skill.m.IsWeaponSkill && !_skill.m.IsOffensiveToolSkill)
		{
			local hasExecutionerPerk = this.getContainer().getSkillByID("perk.coup_de_grace") != null;
			local hasTemporaryInjury = _targetEntity.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury);
			if(hasExecutionerPerk && hasTemporaryInjury)
			{
				local noDamageOverflow = _targetEntity.getHitpoints() > _hitInfo.DamageInflictedHitpoints;
				local notFleeing = _targetEntity.getMoraleState() != this.Const.MoraleState.Fleeing
				if(noDamageOverflow && notFleeing)
				{
					this.m.ExecutionerPerkLanded += 1;
				}
				this.m.ExecutionerPerkAttack += 1;
			}
		}
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		if(_skill.m.IsAttack && _skill.m.IsWeaponSkill && !_skill.m.IsOffensiveToolSkill)
		{
			local actor = this.getContainer().getActor();
			local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if(item != null)
			{
				if(item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					this.m.MeleeAttack += 1;
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.RangeAttack += 1;
				}
			}
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if(_skill.m.IsAttack && _skill.m.IsWeaponSkill && !_skill.m.IsOffensiveToolSkill)
		{
			this.m.DamageDealtHitpoints = _damageInflictedHitpoints;
			this.m.DamageDealtArmor = _damageInflictedArmor;

			local actor = this.getContainer().getActor();
			local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if(item != null)
			{
				if(item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					this.m.MeleeAttack += 1;
					this.m.MeleeLanded += 1;
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.RangeAttack += 1;
					this.m.RangeLanded += 1;
				}
			}
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		this.m.DamageReceiveHitpoints = _damageHitpoints;
		this.m.DamageReceiveArmor 	= _damageArmor;

		local item = _attacker.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if(item != null)
		{
			if(item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
			{
				this.m.BeingMeleeAttack += 1;
				this.m.BeingMeleeLanded += 1;
			}
			if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
			{
				this.m.BeingRangeAttack += 1;
				this.m.BeingRangeLanded += 1;
			}
		}
	}

	function onMissed( _attacker, _skill )
	{
		if(_skill.m.IsAttack && _skill.m.IsWeaponSkill && !_skill.m.IsOffensiveToolSkill)
		{
			local item = _attacker.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if(item != null)
			{
				if(item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					this.m.BeingMeleeAttack += 1;
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.BeingRangeAttack += 1;
				}
			}
		}
	}

	
	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);

		local Version = 1;
		_out.writeU32(Version);

		_out.writeU32(this.m.DamageDealtHitpoints);
		_out.writeU32(this.m.DamageDealtArmor);
		_out.writeU32(this.m.MeleeAttack);
		_out.writeU32(this.m.MeleeLanded);
		_out.writeU32(this.m.RangeAttack);
		_out.writeU32(this.m.RangeLanded);

		_out.writeU32(this.m.DamageReceiveHitpoints);
		_out.writeU32(this.m.DamageReceiveArmor);
		_out.writeU32(this.m.BeingMeleeAttack);
		_out.writeU32(this.m.BeingMeleeLanded);
		_out.writeU32(this.m.BeingRangeAttack);
		_out.writeU32(this.m.BeingRangeLanded);

		_out.writeU32(this.m.ExecutionerPerkAttack);
		_out.writeU32(this.m.ExecutionerPerkLanded);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);

		local Version = _in.readU32();

		if(Version == 1)
		{
			this.m.DamageDealtHitpoints	= _in.readU32();
			this.m.DamageDealtArmor 	= _in.readU32();
			this.m.MeleeAttack 	= _in.readU32();
			this.m.MeleeLanded 	= _in.readU32();
			this.m.RangeAttack 	= _in.readU32();
			this.m.RangeLanded 	= _in.readU32();
			
			this.m.DamageReceiveHitpoints	= _in.readU32();
			this.m.DamageReceiveArmor 		= _in.readU32();
			this.m.BeingMeleeAttack	= _in.readU32();
			this.m.BeingMeleeLanded	= _in.readU32();
			this.m.BeingRangeAttack	= _in.readU32();
			this.m.BeingRangeLanded	= _in.readU32();

			this.m.ExecutionerPerkAttack  = _in.readU32();
			this.m.ExecutionerPerkLanded  = _in.readU32();
		}
	}
});

