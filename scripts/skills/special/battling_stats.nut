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

		NineLivesPerkActivated = 0,

		LastDamageDealtHitpoints = 0,
		LastDamageDealtArmor = 0,
		LastMeleeAttack = 0,
		LastMeleeLanded = 0,
		LastRangeAttack = 0,
		LastRangeLanded = 0,

		LastDamageReceiveHitpoints = 0,
		LastDamageReceiveArmor = 0,
		LastBeingMeleeAttack = 0,
		LastBeingMeleeLanded = 0,
		LastBeingRangeAttack = 0,
		LastBeingRangeLanded = 0
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

		local HPDamageText = "Dealt=" + this.m.DamageDealtHitpoints +
			", Recieved=" + this.m.DamageReceiveHitpoints +
			", Rate=" + (this.m.DamageReceiveHitpoints == 0 
							? this.m.DamageDealtHitpoints
							: this.Math.round(100 * this.m.DamageDealtHitpoints / this.m.DamageReceiveHitpoints)
						) + "%";

		local ArmorDamageText = "Dealt="  + this.m.DamageDealtArmor + 
			", Recieved=" + this.m.DamageReceiveArmor + 
			", Rate=" + (this.m.DamageReceiveArmor == 0 
							? this.m.DamageDealtArmor
							: this.Math.round(100 * this.m.DamageDealtArmor / this.m.DamageReceiveArmor)
						) + "%";
				
		local MeleeAttackText = "Attack=" + this.m.MeleeAttack +
			", Landed=" + this.m.MeleeLanded  + 
			", Rate=" + (this.m.MeleeAttack == 0 
							? this.m.MeleeLanded
							: this.Math.round(100.0 * this.m.MeleeLanded / this.m.MeleeAttack)
						) + "%";

		local RangedAttackText = "Attack=" + this.m.RangeAttack +
			", Landed=" + this.m.RangeLanded  + 
			", Rate=" + (this.m.RangeAttack == 0 
							? this.m.RangeLanded
							: this.Math.round(100.0 * this.m.RangeLanded / this.m.RangeAttack)
						) + "%";

		ret.push({ id = 10, type = "text", icon = "ui/icons/regular_damage.png",	text = HPDamageText});
		ret.push({ id = 11, type = "text", icon = "ui/icons/armor_damage.png", 		text = ArmorDamageText});
		ret.push({ id = 12, type = "text", icon = "ui/icons/damage_dealt.png",		text = MeleeAttackText});
		ret.push({ id = 13, type = "text", icon = "ui/icons/ranged_skill.png",		text = RangedAttackText});

		if(this.m.BeingMeleeAttack > 0)
		{
			local BeingAttackMeleeText = "Being Hit=" + this.m.BeingMeleeLanded 
					+ ", Dodge Rate=" 
					+ (this.m.BeingMeleeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.BeingMeleeAttack - this.m.BeingMeleeLanded) / this.m.BeingMeleeAttack)
						) + "%";
			ret.push({
				id = 23,
				type = "text",
				icon = "ui/icons/shield_damage.png",
				text = BeingAttackMeleeText
			});
		}

		if(this.m.BeingRangeAttack > 0)
		{
			local BeingAttackRangedText ="Being Shot=" + this.m.BeingRangeLanded 
					+ ", Dodge Rate=" 
					+ (this.m.BeingRangeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.BeingRangeAttack - this.m.BeingRangeLanded) / this.m.BeingRangeAttack)
						) + "%";
			ret.push({
				id = 24,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = BeingAttackRangedText
			});
		}

		if(this.m.ExecutionerPerkAttack > 0)
		{
			ret.push({
				id = 31,
				type = "text",
				icon = "ui/perks/perk_16.png",
				text = "Executioner=" + this.m.ExecutionerPerkLanded
					+ ", Effective Rate=" 
					+ this.Math.round(100.0 * this.m.ExecutionerPerkLanded  / this.m.ExecutionerPerkAttack) 
					+ "%"
			});
		}

		if(this.m.NineLivesPerkActivated > 0)
		{
			local timesText = this.m.NineLivesPerkActivated == 1
				? "once."
				: 	(this.m.NineLivesPerkActivated == 2
						? "twice."
						: this.m.NineLivesPerkActivated + "times."
					);

			ret.push({
				id = 32,
				type = "text",
				icon = "ui/perks/perk_07.png",
				text = "9L save you from dead " + timesText
			});
		}


		if(this.m.LastDamageDealtHitpoints > 0 || this.m.LastDamageReceiveHitpoints > 0)
		{
			local HPDamageText = "(Last)Dealt=" + this.m.LastDamageDealtHitpoints +
				", Recieved=" + this.m.LastDamageReceiveHitpoints +
				", Rate=" + (this.m.LastDamageReceiveHitpoints == 0 
								? this.m.LastDamageDealtHitpoints
								: this.Math.round(100 * this.m.LastDamageDealtHitpoints / this.m.LastDamageReceiveHitpoints)
							) + "%";
			ret.push({ id = 10, type = "text", icon = "ui/icons/regular_damage.png",	text = HPDamageText});
		}

		if(this.m.LastDamageDealtArmor > 0 || this.m.LastDamageReceiveArmor > 0)
		{
			local ArmorDamageText = "(Last)Dealt="  + this.m.LastDamageDealtArmor + 
				", Recieved=" + this.m.LastDamageReceiveArmor + 
				", Rate=" + (this.m.LastDamageReceiveArmor == 0 
								? this.m.LastDamageDealtArmor
								: this.Math.round(100 * this.m.LastDamageDealtArmor / this.m.LastDamageReceiveArmor)
							) + "%";
			ret.push({ id = 11, type = "text", icon = "ui/icons/armor_damage.png", 		text = ArmorDamageText});
		}

		if(this.m.LastMeleeAttack > 0 || this.m.LastMeleeLanded > 0)
		{
			local MeleeAttackText = "(Last)Attack=" + this.m.LastMeleeAttack +
				", Landed=" + this.m.LastMeleeLanded  + 
				", Rate=" + (this.m.LastMeleeAttack == 0 
								? this.m.LastMeleeLanded
								: this.Math.round(100.0 * this.m.LastMeleeLanded / this.m.LastMeleeAttack)
							) + "%";
			ret.push({ id = 12, type = "text", icon = "ui/icons/damage_dealt.png",		text = MeleeAttackText});
		}

		if(this.m.LastRangeAttack > 0 || this.m.LastRangeLanded > 0)
		{
			local RangedAttackText = "(Last)Attack=" + this.m.LastRangeAttack +
				", Landed=" + this.m.LastRangeLanded  + 
				", Rate=" + (this.m.LastRangeAttack == 0 
								? this.m.LastRangeLanded
								: this.Math.round(100.0 * this.m.LastRangeLanded / this.m.LastRangeAttack)
							) + "%";
			ret.push({ id = 13, type = "text", icon = "ui/icons/ranged_skill.png",		text = RangedAttackText});
		}

		if(this.m.LastBeingMeleeAttack > 0)
		{
			local BeingAttackMeleeText = "(Last)Being Hit=" + this.m.LastBeingMeleeLanded 
					+ ", Dodge Rate=" 
					+ (this.m.LastBeingMeleeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.LastBeingMeleeAttack - this.m.LastBeingMeleeLanded) / this.m.LastBeingMeleeAttack)
						) + "%";
			ret.push({
				id = 23,
				type = "text",
				icon = "ui/icons/shield_damage.png",
				text = BeingAttackMeleeText
			});
		}

		if(this.m.LastBeingRangeAttack > 0)
		{
			local BeingAttackRangedText ="(Last)Being Shot=" + this.m.LastBeingRangeLanded 
					+ ", Dodge Rate=" 
					+ (this.m.LastBeingRangeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.LastBeingRangeAttack - this.m.LastBeingRangeLanded) / this.m.LastBeingRangeAttack)
						) + "%";
			ret.push({
				id = 24,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = BeingAttackRangedText
			});
		}

		return ret;
	}

	function onCombatStarted()
	{
		this.m.LastDamageDealtHitpoints = 0;
		this.m.LastDamageDealtArmor = 0;
		this.m.LastMeleeAttack = 0;
		this.m.LastMeleeLanded = 0;
		this.m.LastRangeAttack = 0;
		this.m.LastRangeLanded = 0;
		this.m.LastDamageReceiveHitpoints = 0;
		this.m.LastDamageReceiveArmor = 0;
		this.m.LastBeingMeleeAttack = 0;
		this.m.LastBeingMeleeLanded = 0;
		this.m.LastBeingRangeAttack = 0;
		this.m.LastBeingRangeLanded = 0;
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
					this.m.LastMeleeAttack += 1;
					
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.RangeAttack += 1;
					this.m.LastRangeAttack+= 1;
				}
			}
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if(_skill.m.IsAttack && _skill.m.IsWeaponSkill && !_skill.m.IsOffensiveToolSkill)
		{
			this.m.DamageDealtHitpoints += _damageInflictedHitpoints;
			this.m.DamageDealtArmor 	+= _damageInflictedArmor;
			this.m.LastDamageDealtHitpoints += _damageInflictedHitpoints;
			this.m.LastDamageDealtArmor 	+= _damageInflictedArmor;

			local actor = this.getContainer().getActor();
			local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
			if(item != null)
			{
				if(item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
				{
					this.m.MeleeAttack += 1;
					this.m.MeleeLanded += 1;

					this.m.LastMeleeAttack += 1;
					this.m.LastMeleeLanded += 1;
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.RangeAttack += 1;
					this.m.RangeLanded += 1;

					this.m.LastRangeAttack += 1;
					this.m.LastRangeLanded += 1;
				}
			}
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		this.m.DamageReceiveHitpoints	+= _damageHitpoints;
		this.m.DamageReceiveArmor 		+= _damageArmor;

		this.m.LastDamageReceiveHitpoints 	+= _damageHitpoints;
		this.m.LastDamageReceiveArmor 		+= _damageArmor;

		local item = _attacker.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if(item != null)
		{
			if(item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
			{
				this.m.BeingMeleeAttack += 1;
				this.m.BeingMeleeLanded += 1;
				this.m.LastBeingMeleeAttack += 1;
				this.m.LastBeingMeleeLanded += 1;
			}
			if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
			{
				this.m.BeingRangeAttack += 1;
				this.m.BeingRangeLanded += 1;
				this.m.LastBeingRangeAttack += 1;
				this.m.LastBeingRangeLanded += 1;
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
					this.m.BeingMeleeAttack += 1;
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.LastBeingRangeAttack += 1;
					this.m.LastBeingRangeAttack += 1;
				}
			}
		}
	}

	function onTurnEnd()
	{
		local perk9L = this.getContainer().getSkillByID("perk.nine_lives");
		if(perk9L != null && perk9L.isSpent())
		{
			this.m.NineLivesPerkActivated +=1 ;
		}
	}

	function onTurnStart()
	{
		local perk9L = this.getContainer().getSkillByID("perk.nine_lives");
		if(perk9L != null && perk9L.isSpent())
		{
			this.m.NineLivesPerkActivated +=1 ;
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
		_out.writeU32(this.m.NineLivesPerkActivated);
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

			this.m.NineLivesPerkActivated  = _in.readU32();
			
		}
	}
});

