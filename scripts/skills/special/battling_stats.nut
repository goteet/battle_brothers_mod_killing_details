this.battling_stats <- this.inherit("scripts/skills/skill", {
	m = 
	{
		DamageDealtHeadHP = 0,
		DamageDealtBodyHP = 0,
		DamageDealtHelmet = 0,
		DamageDealtArmor = 0,
		MeleeAttack = 0,
		MeleeLanded = 0,
		RangeAttack = 0,
		RangeLanded = 0,
		HeadblowLanded = 0,

		DamageReceiveHeadHP = 0,
		DamageReceiveBodyHP = 0,
		DamageReceiveHelmet = 0,
		DamageReceiveArmor = 0,
		BeingMeleeAttack = 0,
		BeingMeleeLanded = 0,
		BeingRangeAttack = 0,
		BeingRangeLanded = 0,
		BeingHeadblowed = 0,

		ExecutionerPerkAttack = 0,
		ExecutionerPerkLanded = 0,

		NineLivesPerkActivated = 0,

		LastDamageDealtBodyHP = 0,
		LastDamageDealtHeadHP = 0,
		LastDamageDealtHelmet = 0,
		LastDamageDealtArmor = 0,
		LastMeleeAttack = 0,
		LastMeleeLanded = 0,
		LastRangeAttack = 0,
		LastRangeLanded = 0,
		LastHeadblowLanded = 0,

		LastDamageReceiveHeadHP = 0,
		LastDamageReceiveBodyHP = 0,
		LastDamageReceiveHelmet = 0,
		LastDamageReceiveArmor = 0,
		LastBeingMeleeAttack = 0,
		LastBeingMeleeLanded = 0,
		LastBeingRangeAttack = 0,
		LastBeingRangeLanded = 0,
		LastBeingHeadblowed = 0,

		NineLivesPerkActivatedThisBattle = 0,
		ReceiveDamageBodyPartThisSkill = 0,
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
			},

			{
				id = 10,
				type = "text",
				text = "Lifetime Stats:"
			}
		];

		if(this.m.DamageDealtHeadHP > 0 || this.m.DamageDealtBodyHP > 0)
		{
			local totalDamage = this.m.DamageDealtHeadHP + this.m.DamageDealtBodyHP;
			local headRatio = this.m.DamageDealtBodyHP == 0 
				? this.m.DamageDealtHeadHP
				: this.Math.round(100.0 * this.m.DamageDealtHeadHP / totalDamage);

			local HPDamageText = "Dealt=" + totalDamage +
				", H=" + this.m.DamageDealtHeadHP + 
				", B=" + this.m.DamageDealtBodyHP + 
				", HR=" + headRatio + "%";
			ret.push({ id = 11, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText});
		}

		if(this.m.DamageDealtHelmet > 0 || this.m.DamageDealtArmor > 0)
		{
			local totalDamage = this.m.DamageDealtHelmet + this.m.DamageDealtArmor;
			local headRatio = this.m.DamageDealtArmor == 0 
				? this.m.DamageDealtHelmet
				: this.Math.round(100.0 * this.m.DamageDealtHelmet / totalDamage);

			local armorDamageText = "Dealt=" + totalDamage +
				", H=" + this.m.DamageDealtHelmet + 
				", B=" + this.m.DamageDealtArmor + 
				", HR=" + headRatio + "%";
			ret.push({ id = 12, type = "text", icon = "ui/icons/armor_damage.png",	text = armorDamageText});
		}

		if(this.m.MeleeLanded > 0 || this.m.RangeLanded > 0)
		{
			local headRatio = this.Math.round(100.0 * this.m.HeadblowLanded / (this.m.MeleeLanded + this.m.RangeLanded));
			local headBlowText = "Land=" + this.m.HeadblowLanded +
				", Ratio=" + headRatio + "%";
			ret.push({ id = 13, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
		}
		
		if(this.m.MeleeAttack > 0)
		{
			local ratio = this.m.MeleeAttack == 0 
				? this.m.MeleeLanded
				: this.Math.round(100.0 * this.m.MeleeLanded / this.m.MeleeAttack);

			local meleeAttackText = "Attack=" + this.m.MeleeAttack +
				", Landed=" + this.m.MeleeLanded  + 
				", R=" + ratio + "%";

			ret.push({ id = 14, type = "text", icon = "ui/icons/melee_skill.png", text = meleeAttackText});
		}

		if(this.m.RangeAttack > 0)
		{
			local ratio = this.m.RangeAttack == 0 
				? this.m.RangeLanded
				: this.Math.round(100.0 * this.m.RangeLanded / this.m.RangeAttack);

			local rangedAttackText = "Attack=" + this.m.RangeAttack +
				", Landed=" + this.m.RangeLanded  + 
				", R=" + ratio + "%";
			ret.push({ id = 15, type = "text", icon = "ui/icons/ranged_skill.png", text = rangedAttackText});
		}

		if(this.m.DamageReceiveHeadHP > 0 ||  this.m.DamageReceiveBodyHP > 0)
		{
			local totalDamage = this.m.DamageReceiveHeadHP + this.m.DamageReceiveBodyHP;
			local headRatio = this.m.DamageReceiveBodyHP == 0 
				? this.m.DamageReceiveHeadHP
				: this.Math.round(100.0 * this.m.DamageReceiveHeadHP / totalDamage);

			local HPDamageText = "Recv=" + totalDamage +
				", H=" + this.m.DamageReceiveHeadHP + 
				", B=" + this.m.DamageReceiveBodyHP + 
				", R=" + headRatio + "%";
			ret.push({ id = 21, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText });
		}
		
		if(this.m.DamageReceiveHelmet > 0 || this.m.DamageReceiveArmor > 0)
		{
			local totalDamage = this.m.DamageReceiveHelmet + this.m.DamageReceiveArmor;
			local headRatio = this.m.DamageReceiveArmor == 0 
				? this.m.DamageReceiveHelmet
				: this.Math.round(100.0 * this.m.DamageReceiveHelmet / totalDamage);

			local armorDamageText = "Recv=" + totalDamage +
				", H=" + this.m.DamageReceiveHelmet + 
				", B=" + this.m.DamageReceiveArmor + 
				", R=" + headRatio + "%";
			ret.push({ id = 22, type = "text", icon = "ui/icons/armor_damage.png",	text = armorDamageText });
		}

		if(this.m.BeingMeleeLanded > 0 || this.m.BeingRangeLanded > 0)
		{
			local headBodyRatio = this.Math.round(100.0 * this.m.BeingHeadblowed / (this.m.BeingMeleeLanded + this.m.BeingRangeLanded));
			local headBlowText = "Being Blow=" + this.m.BeingHeadblowed + 
				", Ratio=" + headBodyRatio + "%";
			ret.push({ id = 23, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
		}

		if(this.m.BeingMeleeAttack > 0)
		{
			local BeingAttackMeleeText = "Being Hit=" + this.m.BeingMeleeLanded 
					+ ", Dodge=" 
					+ (this.m.BeingMeleeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.BeingMeleeAttack - this.m.BeingMeleeLanded) / this.m.BeingMeleeAttack)
						) + "%";
			ret.push({ id = 24, type = "text", icon = "ui/icons/shield_damage.png", text = BeingAttackMeleeText });
		}

		if(this.m.BeingRangeAttack > 0)
		{
			local BeingAttackRangedText ="Being Shot=" + this.m.BeingRangeLanded 
					+ ", Dodge=" 
					+ (this.m.BeingRangeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.BeingRangeAttack - this.m.BeingRangeLanded) / this.m.BeingRangeAttack)
						) + "%";
			ret.push({ id = 25,	type = "text", icon = "ui/icons/ranged_defense.png", text = BeingAttackRangedText });
		}

		if(this.m.ExecutionerPerkAttack > 0 
		|| this.m.NineLivesPerkActivated > 0)
		{
			ret.push({ id = 30, type = "text", text = "Perk Stats:" });
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
						: this.m.NineLivesPerkActivated + " times."
					);

			ret.push({
				id = 32,
				type = "text",
				icon = "ui/perks/perk_07.png",
				text = "9L save you from dead " + timesText
			});
		}

		if(this.m.LastDamageDealtBodyHP > 0 || this.m.LastDamageDealtHeadHP > 0
		|| this.m.LastDamageDealtHelmet > 0 || this.m.LastDamageDealtArmor > 0
		|| this.m.LastHeadblowLanded > 0 
		|| this.m.LastMeleeAttack > 0 || this.m.LastMeleeLanded > 0
		|| this.m.LastRangeAttack > 0 || this.m.LastRangeLanded > 0
		|| this.m.LastDamageReceiveHeadHP > 0 ||  this.m.LastDamageReceiveBodyHP > 0
		|| this.m.LastDamageReceiveHelmet > 0 || this.m.LastDamageReceiveArmor > 0
		|| this.m.LastBeingHeadblowed > 0
		|| this.m.LastBeingMeleeAttack > 0 || this.m.LastBeingRangeAttack > 0)
		{
			ret.push({ id = 40, type = "text", text = "Last Battle Stats:" });
		}
		if(this.m.LastDamageDealtBodyHP > 0 || this.m.LastDamageDealtHeadHP > 0)
		{
			local totalDamage = this.m.LastDamageDealtHeadHP + this.m.LastDamageDealtBodyHP;
			local headRatio = this.m.LastDamageDealtBodyHP == 0 
				? this.m.LastDamageDealtHeadHP
				: this.Math.round(100.0 * this.m.LastDamageDealtHeadHP / totalDamage);

			local HPDamageText = "(L)Dealt=" + totalDamage +
				", H=" + this.m.LastDamageDealtHeadHP + 
				", B=" + this.m.LastDamageDealtBodyHP + 
				", R=" + headRatio + "%";
			ret.push({ id = 41, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText });
		}

		if(this.m.LastDamageDealtHelmet > 0 || this.m.LastDamageDealtArmor > 0)
		{
			local totalDamage = this.m.LastDamageDealtHelmet + this.m.LastDamageDealtArmor;
			local headRatio = this.m.LastDamageDealtArmor == 0 
				? this.m.LastDamageDealtHelmet
				: this.Math.round(100.0 * this.m.LastDamageDealtHelmet / totalDamage);

			local armorDamageText = "(L)Dealt=" + totalDamage +
				", H=" + this.m.LastDamageDealtHelmet + 
				", B=" + this.m.LastDamageDealtArmor + 
				", R=" + headRatio + "%";
			ret.push({ id = 42, type = "text", icon = "ui/icons/armor_damage.png",	text = armorDamageText });
		}

		if(this.m.LastHeadblowLanded > 0)
		{
			local headRatioLast = this.Math.round(100.0 * this.m.LastHeadblowLanded / (this.m.LastMeleeLanded + this.m.LastRangeLanded));
			local headBlowText = "(L)Blow=" + this.m.LastHeadblowLanded +
				", Ratio=" + headRatioLast + "%";
			ret.push({ id = 43, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
		}

		if(this.m.LastMeleeAttack > 0 || this.m.LastMeleeLanded > 0)
		{
			local MeleeAttackText = "(L)Attack=" + this.m.LastMeleeAttack +
				", Landed=" + this.m.LastMeleeLanded  + 
				", Rate=" + (this.m.LastMeleeAttack == 0 
								? this.m.LastMeleeLanded
								: this.Math.round(100.0 * this.m.LastMeleeLanded / this.m.LastMeleeAttack)
							) + "%";
			ret.push({ id = 44, type = "text", icon = "ui/icons/damage_dealt.png",		text = MeleeAttackText});
		}

		if(this.m.LastRangeAttack > 0 || this.m.LastRangeLanded > 0)
		{
			local RangedAttackText = "(L)Attack=" + this.m.LastRangeAttack +
				", Landed=" + this.m.LastRangeLanded  + 
				", Rate=" + (this.m.LastRangeAttack == 0 
								? this.m.LastRangeLanded
								: this.Math.round(100.0 * this.m.LastRangeLanded / this.m.LastRangeAttack)
							) + "%";
			ret.push({ id = 45, type = "text", icon = "ui/icons/ranged_skill.png",		text = RangedAttackText});
		}
		
		if(this.m.LastDamageReceiveHeadHP > 0 ||  this.m.LastDamageReceiveBodyHP > 0)
		{
			local totalDamage = this.m.LastDamageReceiveHeadHP + this.m.LastDamageReceiveBodyHP;
			local headRatio = this.m.LastDamageReceiveBodyHP == 0 
				? this.m.LastDamageReceiveHeadHP
				: this.Math.round(100.0 * this.m.LastDamageReceiveHeadHP / totalDamage);

			local HPDamageText = "(L)Recv=" + totalDamage +
				", H=" + this.m.LastDamageReceiveHeadHP + 
				", B=" + this.m.LastDamageReceiveBodyHP + 
				", HR=" + headRatio + "%";
			ret.push({ id = 46, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText });
		}

		if(this.m.LastDamageReceiveHelmet > 0 || this.m.LastDamageReceiveArmor > 0)
		{
			local totalDamage = this.m.LastDamageReceiveHelmet + this.m.LastDamageReceiveArmor;
			local headRatio = this.m.LastDamageReceiveArmor == 0 
				? this.m.LastDamageReceiveHelmet
				: this.Math.round(100 * this.m.LastDamageReceiveHelmet / totalDamage);

			local armorDamageText = "(L)Recv=" + totalDamage +
				", H=" + this.m.LastDamageReceiveHelmet + 
				", B=" + this.m.LastDamageReceiveArmor + 
				", HR=" + headRatio + "%";
			ret.push({ id = 47, type = "text", icon = "ui/icons/armor_damage.png",	text = armorDamageText });
		}

		if(this.m.LastBeingHeadblowed > 0)
		{
			local headRatio = this.Math.round(100.0 * this.m.LastBeingHeadblowed / (this.m.LastBeingMeleeLanded + this.m.LastBeingRangeLanded));
			local headBlowText = "(L)Being Blow=" + this.m.LastBeingHeadblowed + 
				", Ratio=" + headRatio + "%";
			ret.push({ id = 48, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
		}
		
		if(this.m.LastBeingMeleeAttack > 0)
		{
			local BeingAttackMeleeText = "(L)Being Hit=" + this.m.LastBeingMeleeLanded 
					+ ", Dodge=" 
					+ (this.m.LastBeingMeleeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.LastBeingMeleeAttack - this.m.LastBeingMeleeLanded) / this.m.LastBeingMeleeAttack)
						) + "%";
			ret.push({
				id = 49,
				type = "text",
				icon = "ui/icons/shield_damage.png",
				text = BeingAttackMeleeText
			});
		}

		if(this.m.LastBeingRangeAttack > 0)
		{
			local BeingAttackRangedText ="(L)Being Shot=" + this.m.LastBeingRangeLanded 
					+ ", Dodge=" 
					+ (this.m.LastBeingRangeAttack == 0 
						? "-"
						: this.Math.round(100.0 * (this.m.LastBeingRangeAttack - this.m.LastBeingRangeLanded) / this.m.LastBeingRangeAttack)
						) + "%";
			ret.push({
				id = 50,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = BeingAttackRangedText
			});
		}

		return ret;
	}

	function onCombatStarted()
	{
		this.m.LastDamageDealtBodyHP = 0;
		this.m.LastDamageDealtArmor = 0;
		this.m.LastMeleeAttack = 0;
		this.m.LastMeleeLanded = 0;
		this.m.LastRangeAttack = 0;
		this.m.LastRangeLanded = 0;
		this.m.LastHeadblowLanded = 0;

		this.m.LastDamageReceiveBodyHP = 0;
		this.m.LastDamageReceiveArmor = 0;
		this.m.LastBeingMeleeAttack = 0;
		this.m.LastBeingMeleeLanded = 0;
		this.m.LastBeingRangeAttack = 0;
		this.m.LastBeingRangeLanded = 0;
		this.m.LastBeingHeadblowed = 0;

		this.m.NineLivesPerkActivatedThisBattle = 0;
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

			if(_bodyPart == this.Const.BodyPart.Head)
			{
				this.m.HeadblowLanded		+= 1;
				this.m.LastHeadblowLanded  	+= 1;

				this.m.DamageDealtHeadHP 		+= _damageInflictedHitpoints;
				this.m.DamageDealtHelmet		+= _damageInflictedArmor;
				this.m.LastDamageDealtHeadHP 	+= _damageInflictedHitpoints;
				this.m.LastDamageDealtHelmet 	+= _damageInflictedArmor;
			}
			else
			{
				this.m.DamageDealtBodyHP 		+= _damageInflictedHitpoints;
				this.m.DamageDealtArmor 		+= _damageInflictedArmor;
				this.m.LastDamageDealtBodyHP 	+= _damageInflictedHitpoints;
				this.m.LastDamageDealtArmor 	+= _damageInflictedArmor;
			}
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if(_attacker != null && _attacker.getFaction() != this.getContainer().getActor().getFaction())
		{
			if (_hitInfo.BodyPart == this.Const.BodyPart.Head)
			{
				this.m.BeingHeadblowed		+= 1;
				this.m.LastBeingHeadblowed	+= 1;
			}
		}
		this.m.ReceiveDamageBodyPartThisSkill = _hitInfo.BodyPart;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if(_attacker != null && _attacker.getFaction() != this.getContainer().getActor().getFaction())
		{
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
			else
			{
				this.m.BeingMeleeAttack += 1;
				this.m.BeingMeleeLanded += 1;
				this.m.LastBeingMeleeAttack += 1;
				this.m.LastBeingMeleeLanded += 1;
			}

			if(this.m.ReceiveDamageBodyPartThisSkill == this.Const.BodyPart.Head)
			{
				this.m.DamageReceiveHeadHP	+= _damageHitpoints;
				this.m.DamageReceiveHelmet 	+= _damageArmor;

				this.m.LastDamageReceiveHeadHP 	+= _damageHitpoints;
				this.m.LastDamageReceiveHelmet 	+= _damageArmor;
			}
			else
			{
				this.m.DamageReceiveBodyHP	+= _damageHitpoints;
				this.m.DamageReceiveArmor 	+= _damageArmor;

				this.m.LastDamageReceiveBodyHP 	+= _damageHitpoints;
				this.m.LastDamageReceiveArmor 	+= _damageArmor;
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
					this.m.LastBeingMeleeAttack += 1;
				}
				if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
				{
					this.m.BeingRangeAttack += 1;
					this.m.LastBeingRangeAttack += 1;
				}
			}
		}
	}

	function onTurnEnd()
	{
		local perk9L = this.getContainer().getSkillByID("perk.nine_lives");
		if(perk9L != null && perk9L.isSpent() && this.m.NineLivesPerkActivatedThisBattle == 0)
		{
			this.m.NineLivesPerkActivated +=1 ;
			this.m.NineLivesPerkActivatedThisBattle = 1;
		}
	}

	function onTurnStart()
	{
		local perk9L = this.getContainer().getSkillByID("perk.nine_lives");
		if(perk9L != null && perk9L.isSpent() && this.m.NineLivesPerkActivatedThisBattle == 0)
		{
			this.m.NineLivesPerkActivated +=1 ;
			this.m.NineLivesPerkActivatedThisBattle = 1;
		}
	}

	
	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		
		local Version = 2;
		_out.writeU32(Version);

		_out.writeU32(this.m.DamageDealtHeadHP);
		_out.writeU32(this.m.DamageDealtBodyHP);
		_out.writeU32(this.m.DamageDealtHelmet);
		_out.writeU32(this.m.DamageDealtArmor);
		_out.writeU32(this.m.MeleeAttack);
		_out.writeU32(this.m.MeleeLanded);
		_out.writeU32(this.m.RangeAttack);
		_out.writeU32(this.m.RangeLanded);
		_out.writeU32(this.m.HeadblowLanded);

		_out.writeU32(this.m.DamageReceiveHeadHP);
		_out.writeU32(this.m.DamageReceiveBodyHP);
		_out.writeU32(this.m.DamageReceiveHelmet);
		_out.writeU32(this.m.DamageReceiveArmor);
		_out.writeU32(this.m.BeingMeleeAttack);
		_out.writeU32(this.m.BeingMeleeLanded);
		_out.writeU32(this.m.BeingRangeAttack);
		_out.writeU32(this.m.BeingRangeLanded);
		_out.writeU32(this.m.BeingHeadblowed);

		_out.writeU32(this.m.ExecutionerPerkAttack);
		_out.writeU32(this.m.ExecutionerPerkLanded);

		_out.writeU32(this.m.NineLivesPerkActivated);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);

		local Version = _in.readU32();
		if(Version >=2)
		{
			this.m.DamageDealtHeadHP = _in.readU32();
			this.m.DamageDealtBodyHP = _in.readU32();
			this.m.DamageDealtHelmet = _in.readU32();
			this.m.DamageDealtArmor = _in.readU32();
			this.m.MeleeAttack = _in.readU32();
			this.m.MeleeLanded = _in.readU32();
			this.m.RangeAttack = _in.readU32();
			this.m.RangeLanded = _in.readU32();
			this.m.HeadblowLanded = _in.readU32();

			this.m.DamageReceiveHeadHP = _in.readU32();
			this.m.DamageReceiveBodyHP = _in.readU32();
			this.m.DamageReceiveHelmet = _in.readU32();
			this.m.DamageReceiveArmor = _in.readU32();
			this.m.BeingMeleeAttack = _in.readU32();
			this.m.BeingMeleeLanded = _in.readU32();
			this.m.BeingRangeAttack = _in.readU32();
			this.m.BeingRangeLanded = _in.readU32();
			this.m.BeingHeadblowed = _in.readU32();

			this.m.ExecutionerPerkAttack = _in.readU32();
			this.m.ExecutionerPerkLanded = _in.readU32();

			this.m.NineLivesPerkActivated = _in.readU32();

		}
		else if(Version >=1 && Version < 2)
		{
			this.m.DamageDealtBodyHP	= _in.readU32();
			this.m.DamageDealtArmor 	= _in.readU32();
			this.m.MeleeAttack 	= _in.readU32();
			this.m.MeleeLanded 	= _in.readU32();
			this.m.RangeAttack 	= _in.readU32();
			this.m.RangeLanded 	= _in.readU32();
			
			this.m.DamageReceiveBodyHP	= _in.readU32();
			this.m.DamageReceiveArmor 	= _in.readU32();
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

