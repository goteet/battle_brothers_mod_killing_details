::BattleStats <- {
    TitleName       = "战斗小黑账",
    TooltipText = {
        TitleLifetime   = "生涯统计：",
        TitlePerks      = "技能效益：",
        TitleLastBattle = "上次战斗：" ,

        LifeHPDamage        = "造成了头%d，身%d共%d点生命伤害",
        LifeMeleeAttack     = "击中=%d 攻击=%d 命中率=%d%%",
        LifeRangedAttack    = "命中=%d 射击=%d 命中率=%d%%",
        LifeHeadblowAttack  = "爆头=%d 爆头率=%d%% 伤害占比=%d%%",
        LifeBeingHit        = "受击=%d 被射=%d 闪避率=%d%%",
        LifeBeingHitHead    = "被爆头=%d 爆头率=%d%% 伤害占比=%d%%",

        LastHPDamage        = "造成生命伤害：头%d，身%d，共%d点",
        LastArmorDamage     = "造成护甲伤害：头%d，身%d，共%d点",
        LastMeleeAttack     = "击中=%d, 攻击=%d, 命中率=%d%%",
        LastRangedAttack    = "命中=%d, 射击=%d, 命中率=%d%%",
        LastHeadBlowAttack  = "爆头=%d, 爆头率=%d%%",
        LastHPReceive       = "承受生命伤害：头%d，身%d，共%d点",
        LastArmorRecive     = "受到护甲伤害：头%d，身%d，共%d点",
        LastBeingHit        = "受击=%d, 被射=%d, 闪避率=%d%%",
        LastBeingHitHead    = "被爆头=%d, 爆头率=%d%%, 伤害系数=%d%%",

        PerkExecutioner     = "有效触发%d次，有效率%d%%，有效触发率%d%%，触发%d次，触发率%d%%",
        PerkFastAdaption    = "有效触发%d次，有效触发率%d%%，触发%d次，触发率%d%%",
        Perk9LPrefix        = "9命让你在战斗中濒死存活下来",
        Perk9LTimes1        = "一次。",
        Perk9LTimes2        = "两次。",
        Perk9LTimesN        = "次。",
    }
}

this.battling_stats <- this.inherit("scripts/skills/skill", {
    m = 
    {
        DamageDealtHeadHP   = 0,
        DamageDealtBodyHP   = 0,
        DamageDealtHelmet   = 0,
        DamageDealtArmor    = 0,
        MeleeAttack         = 0,
        MeleeLanded         = 0,
        RangeAttack         = 0,
        RangeLanded         = 0,
        HeadblowLanded      = 0,
        
        DamageReceiveHeadHP = 0,
        DamageReceiveBodyHP = 0,
        DamageReceiveHelmet = 0,
        DamageReceiveArmor  = 0,
        BeingMeleeAttack    = 0,
        BeingMeleeLanded    = 0,
        BeingRangeAttack    = 0,
        BeingRangeLanded    = 0,
        BeingHeadblowLanded = 0,
        
        ExecutionerPerkAttack   = 0,
        ExecutionerPerkLanded   = 0,
        NineLivesPerkActivated  = 0,
        FastAdaptionPerkAttack  = 0,
        FastAdaptionPerkLanded  = 0,

        LastDamageDealtBodyHP   = 0,
        LastDamageDealtHeadHP   = 0,
        LastDamageDealtHelmet   = 0,
        LastDamageDealtArmor    = 0,
        LastMeleeAttack         = 0,
        LastMeleeLanded         = 0,
        LastRangeAttack         = 0,
        LastRangeLanded         = 0,
        LastHeadblowLanded      = 0,

        LastDamageReceiveHeadHP = 0,
        LastDamageReceiveBodyHP = 0,
        LastDamageReceiveHelmet = 0,
        LastDamageReceiveArmor  = 0,
        LastBeingMeleeAttack    = 0,
        LastBeingMeleeLanded    = 0,
        LastBeingRangeAttack    = 0,
        LastBeingRangeLanded    = 0,
        LastBeingHeadblowLanded = 0,
        
        NineLivesPerkActivatedThisBattle    = 0,
        ReceiveDamageBodyPartThisSkill      = 0,
    },


    function create()
    {
        this.m.ID = "special.battling_stats";
        this.m.Name = ::BattleStats.TitleName;
        this.m.Description = "The Killing Detail Counters";
        this.m.Icon = "skills/battling_stats.png";
        this.m.IconMini = "";
        this.m.Order = this.Const.SkillOrder.Trait + 602;
        this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
        this.m.IsActive = false;
        this.m.IsHidden = false;
    }

    function getTooltip()
    {
        local ret = [ { id = 1, type = "title", text = this.getName() } ];

        if (this.m.DamageDealtHeadHP > 0 || this.m.DamageDealtBodyHP > 0 ||
            this.m.MeleeAttack > 0 || this.m.RangeAttack > 0 ||
            this.m.MeleeLanded > 0 || this.m.RangeLanded > 0 ||
            this.m.BeingMeleeAttack > 0 || this.m.BeingRangeAttack > 0 ||
            this.m.BeingMeleeLanded > 0 || this.m.BeingRangeLanded > 0)
        {
           ret.push({ id = 10, type = "text", text = ::BattleStats.TooltipText.TitleLifetime });
        }

        if(this.m.DamageDealtHeadHP > 0 || this.m.DamageDealtBodyHP > 0)
        {
            local HPDamageText = format(::BattleStats.TooltipText.LifeHPDamage
                , this.m.DamageDealtHeadHP
                , this.m.DamageDealtBodyHP
                , this.m.DamageDealtHeadHP + this.m.DamageDealtBodyHP
            );
            ret.push({ id = 11, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText});
        }

        if(this.m.MeleeAttack > 0)
        {
            local ratio = this.m.MeleeAttack == 0 
                ? this.m.MeleeLanded
                : this.Math.round(100.0 * this.m.MeleeLanded / this.m.MeleeAttack);

            local meleeAttackText = format(::BattleStats.TooltipText.LifeMeleeAttack
                , this.m.MeleeLanded
                , this.m.MeleeAttack
                , ratio);

            ret.push({ id = 14, type = "text", icon = "ui/icons/melee_skill.png", text = meleeAttackText});
        }

        if(this.m.RangeAttack > 0)
        {
            local ratio = this.m.RangeAttack == 0 
                ? this.m.RangeLanded
                : this.Math.round(100.0 * this.m.RangeLanded / this.m.RangeAttack);

            local rangedAttackText = format(::BattleStats.TooltipText.LifeRangedAttack
                , this.m.RangeLanded
                , this.m.RangeAttack
                , ratio);
            ret.push({ id = 15, type = "text", icon = "ui/icons/ranged_skill.png", text = rangedAttackText});
        }

        if(this.m.MeleeLanded > 0 || this.m.RangeLanded > 0)
        {
            local headBlowText = format(::BattleStats.TooltipText.LifeHeadblowAttack
                , this.m.HeadblowLanded
                , this.Math.round(100.0 * this.m.HeadblowLanded / (this.m.MeleeLanded + this.m.RangeLanded))
                , this.Math.round(100.0 * this.m.DamageDealtHeadHP / (this.m.DamageDealtHeadHP + this.m.DamageDealtBodyHP))
            );
            ret.push({ id = 13, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
        }
        
        if(this.m.BeingMeleeAttack > 0 || this.m.BeingRangeAttack > 0)
        {
            local dodgeRatio = 100 - this.Math.round(100.0 * (this.m.BeingRangeLanded + this.m.BeingMeleeLanded) / (this.m.BeingRangeAttack + this.m.BeingMeleeAttack));
            local BeAttackedText = format(::BattleStats.TooltipText.LifeBeingHit, this.m.BeingMeleeLanded , this.m.BeingRangeLanded, dodgeRatio);
            ret.push({ id = 49, type = "text", icon = "ui/icons/shield_damage.png", text = BeAttackedText });
        }
        
        if(this.m.BeingMeleeLanded > 0 || this.m.BeingRangeLanded > 0)
        {
            local totalDamage = this.m.DamageReceiveHeadHP + this.m.DamageReceiveBodyHP;
            local damageRatio = totalDamage > 0 ? this.Math.round(100.0 * this.m.DamageReceiveHeadHP / totalDamage) : this.m.DamageReceiveHeadHP;
            local headBlowText = format(::BattleStats.TooltipText.LifeBeingHitHead
                , this.m.BeingHeadblowLanded
                , this.Math.round(100.0 * this.m.BeingHeadblowLanded / (this.m.BeingMeleeLanded + this.m.BeingRangeLanded))
                , damageRatio
            );
            ret.push({ id = 23, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
        }


        if (this.m.ExecutionerPerkAttack > 0 || 
            this.m.NineLivesPerkActivated > 0 ||
            this.m.FastAdaptionPerkAttack > 0)
        {
            ret.push({ id = 30, type = "text", text = ::BattleStats.TooltipText.TitlePerks  });
        }

        if(this.m.FastAdaptionPerkAttack > 0)
        {
            ret.push({
                id = 31,
                type = "text",
                icon = "ui/perks/perk_33.png",
                text = format(::BattleStats.TooltipText.PerkFastAdaption
                    , this.m.FastAdaptionPerkLanded
                    , this.Math.round(100.0 * this.m.FastAdaptionPerkLanded / this.m.FastAdaptionPerkAttack)
                    , this.m.FastAdaptionPerkAttack
                    , this.Math.round(100.0 * this.m.FastAdaptionPerkAttack / (this.m.MeleeLanded + this.m.RangeLanded))
                )
            
            });
        }

        if(this.m.ExecutionerPerkAttack > 0)
        {
            ret.push({
                id = 32,
                type = "text",
                icon = "ui/perks/perk_16.png",
                text = format(::BattleStats.TooltipText.PerkExecutioner
                    , this.m.ExecutionerPerkLanded
                    , this.Math.round(100.0 * this.m.ExecutionerPerkLanded / this.m.ExecutionerPerkAttack)
                    , this.Math.round(100.0 * this.m.ExecutionerPerkLanded / (this.m.MeleeLanded + this.m.RangeLanded))
                    , this.m.ExecutionerPerkAttack
                    , this.Math.round(100.0 * this.m.ExecutionerPerkAttack / (this.m.MeleeLanded + this.m.RangeLanded))
                )
            });
        }

        if(this.m.NineLivesPerkActivated > 0)
        {
            local timesText = this.m.NineLivesPerkActivated == 1 
                                    ? ::BattleStats.TooltipText.Perk9LTimes1
                                    : (this.m.NineLivesPerkActivated == 2 
                                        ? ::BattleStats.TooltipText.Perk9LTimes2
                                        : this.m.NineLivesPerkActivated + ::BattleStats.TooltipText.Perk9LTimesN);

            ret.push({
                id = 33,
                type = "text",
                icon = "ui/perks/perk_07.png",
                text = ::BattleStats.TooltipText.Perk9LPrefix + timesText
            });
        }

        if (this.m.LastDamageDealtBodyHP > 0 || this.m.LastDamageDealtHeadHP > 0 ||
            this.m.LastDamageDealtHelmet > 0 || this.m.LastDamageDealtArmor > 0 ||
            this.m.LastHeadblowLanded > 0  ||
            this.m.LastMeleeAttack > 0 || this.m.LastMeleeLanded > 0 ||
            this.m.LastRangeAttack > 0 || this.m.LastRangeLanded > 0 ||
            this.m.LastDamageReceiveHeadHP > 0 ||  this.m.LastDamageReceiveBodyHP > 0 ||
            this.m.LastDamageReceiveHelmet > 0 || this.m.LastDamageReceiveArmor > 0 ||
            this.m.LastBeingHeadblowLanded > 0 ||
            this.m.LastBeingMeleeAttack > 0 || this.m.LastBeingRangeAttack > 0)
        {
            ret.push({ id = 40, type = "text", text = ::BattleStats.TooltipText.TitleLastBattle });
        }

        if(this.m.LastDamageDealtBodyHP > 0 || this.m.LastDamageDealtHeadHP > 0)
        {
            local HPDamageText = format(::BattleStats.TooltipText.LastHPDamage
                , this.m.LastDamageDealtHeadHP 
                , this.m.LastDamageDealtBodyHP 
                , this.m.LastDamageDealtHeadHP + this.m.LastDamageDealtBodyHP
            );
            ret.push({ id = 41, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText });
        }

        if(this.m.LastDamageDealtHelmet > 0 || this.m.LastDamageDealtArmor > 0)
        {
            local armorDamageText = format(::BattleStats.TooltipText.LastArmorDamage 
                , this.m.LastDamageDealtHelmet
                , this.m.LastDamageDealtArmor
                , this.m.LastDamageDealtHelmet + this.m.LastDamageDealtArmor
            );
            ret.push({ id = 42, type = "text", icon = "ui/icons/armor_damage.png",    text = armorDamageText });
        }

        if(this.m.LastMeleeAttack > 0 || this.m.LastMeleeLanded > 0)
        {
            local MeleeAttackText =  format(::BattleStats.TooltipText.LastMeleeAttack 
                , this.m.LastMeleeLanded
                , this.m.LastMeleeAttack
                , (this.m.LastMeleeAttack == 0 ? this.m.LastMeleeLanded : this.Math.round(100.0 * this.m.LastMeleeLanded / this.m.LastMeleeAttack))
            );
            ret.push({ id = 44, type = "text", icon = "ui/icons/damage_dealt.png",        text = MeleeAttackText});
        }

        if(this.m.LastRangeAttack > 0 || this.m.LastRangeLanded > 0)
        {
            local RangedAttackText = format(::BattleStats.TooltipText.LastRangedAttack
                , this.m.LastRangeLanded
                , this.m.LastRangeAttack
                , (this.m.LastRangeAttack == 0 ? this.m.LastRangeLanded : this.Math.round(100.0 * this.m.LastRangeLanded / this.m.LastRangeAttack))
            );
            ret.push({ id = 45, type = "text", icon = "ui/icons/ranged_skill.png",        text = RangedAttackText});
        }

        if(this.m.LastHeadblowLanded > 0)
        {
            local headRatioLast = this.Math.round(100.0 * this.m.LastHeadblowLanded / (this.m.LastMeleeLanded + this.m.LastRangeLanded));
            local headBlowText = format(::BattleStats.TooltipText.LastHeadBlowAttack, this.m.LastHeadblowLanded, headRatioLast);
            ret.push({ id = 43, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
        }
        
        if(this.m.LastDamageReceiveHeadHP > 0 ||  this.m.LastDamageReceiveBodyHP > 0)
        {
            local HPDamageText = format(::BattleStats.TooltipText.LastHPReceive 
                , this.m.LastDamageReceiveHeadHP 
                , this.m.LastDamageReceiveBodyHP
                , this.m.LastDamageReceiveHeadHP + this.m.LastDamageReceiveBodyHP
            );
            ret.push({ id = 46, type = "text", icon = "ui/icons/regular_damage.png", text = HPDamageText });
        }

        if(this.m.LastDamageReceiveHelmet > 0 || this.m.LastDamageReceiveArmor > 0)
        {
            local armorDamageText = format(::BattleStats.TooltipText.LastArmorRecive 
                , this.m.LastDamageReceiveHelmet
                , this.m.LastDamageReceiveArmor
                , this.m.LastDamageReceiveHelmet + this.m.LastDamageReceiveArmor
            );
            ret.push({ id = 47, type = "text", icon = "ui/icons/armor_damage.png",    text = armorDamageText });
        }
        if(this.m.LastBeingMeleeAttack > 0 || this.m.LastBeingRangeAttack > 0)
        {
            local dodgeRatio = 100 - this.Math.round(100.0 * (this.m.LastBeingRangeLanded + this.m.LastBeingMeleeLanded) / (this.m.LastBeingRangeAttack + this.m.LastBeingMeleeAttack));
            local BeingAttackText = format(::BattleStats.TooltipText.LastBeingHit, this.m.LastBeingMeleeLanded , this.m.LastBeingRangeLanded, dodgeRatio);
            ret.push({ id = 49, type = "text", icon = "ui/icons/shield_damage.png", text = BeingAttackText });
        }

        if(this.m.LastBeingHeadblowLanded > 0)
        {
            local totalDamage    = this.m.LastDamageReceiveHeadHP + this.m.LastDamageReceiveBodyHP;
            local damageRatio    = totalDamage > 0 ? this.Math.round(100.0 * this.m.LastDamageReceiveHeadHP / totalDamage) : this.m.LastDamageReceiveHeadHP;
            local headBlowText    = format(::BattleStats.TooltipText.LastBeingHitHead
                , this.m.LastBeingHeadblowLanded
                , this.Math.round(100.0 * this.m.LastBeingHeadblowLanded / (this.m.LastBeingMeleeLanded + this.m.LastBeingRangeLanded))
                , damageRatio
            );
            ret.push({ id = 48, type = "text", icon = "ui/icons/chance_to_hit_head.png", text = headBlowText });
        }

        return ret;
    }

    function onCombatStarted()
    {
        this.m.LastDamageDealtBodyHP    = 0;
        this.m.LastDamageDealtHeadHP    = 0;
        this.m.LastDamageDealtHelmet    = 0;
        this.m.LastDamageDealtArmor     = 0;
        this.m.LastMeleeAttack          = 0;
        this.m.LastMeleeLanded          = 0;
        this.m.LastRangeAttack          = 0;
        this.m.LastRangeLanded          = 0;
        this.m.LastHeadblowLanded       = 0;

        this.m.LastDamageReceiveHeadHP  = 0;
        this.m.LastDamageReceiveBodyHP  = 0;
        this.m.LastDamageReceiveHelmet  = 0;
        this.m.LastDamageReceiveArmor   = 0;
        this.m.LastBeingMeleeAttack     = 0;
        this.m.LastBeingMeleeLanded     = 0;
        this.m.LastBeingRangeAttack     = 0;
        this.m.LastBeingRangeLanded     = 0;
        this.m.LastBeingHeadblowLanded  = 0;

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

            
            local skillFastAdaption = this.getContainer().getSkillByID("perk.fast_adaption");
            if(skillFastAdaption != null && skillFastAdaption.m.Stacks > 0)
            {
                local HitchanceAdditional = skillFastAdaption.m.Stacks * 10;
                if(::KillingDetails.HitchanceHook.Chance - HitchanceAdditional < ::KillingDetails.HitchanceHook.Rolled)
                {
                    this.m.FastAdaptionPerkLanded +=1;
                }
                this.m.FastAdaptionPerkAttack +=1;
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
                    this.m.MeleeAttack      += 1;
                    this.m.LastMeleeAttack  += 1;
                }
                if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
                {
                    this.m.RangeAttack      += 1;
                    this.m.LastRangeAttack  += 1;
                }
            }
            else
            {
                this.m.MeleeAttack      += 1;
                this.m.LastMeleeAttack  += 1;
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
                    this.m.MeleeAttack      += 1;
                    this.m.MeleeLanded      += 1;
                    this.m.LastMeleeAttack  += 1;
                    this.m.LastMeleeLanded  += 1;
                }
                if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
                {
                    this.m.RangeAttack      += 1;
                    this.m.RangeLanded      += 1;
                    this.m.LastRangeAttack  += 1;
                    this.m.LastRangeLanded  += 1;
                }
            }
            else
            {
                this.m.MeleeAttack      += 1;
                this.m.MeleeLanded      += 1;
                this.m.LastMeleeAttack  += 1;
                this.m.LastMeleeLanded  += 1;
            }

            if(_bodyPart == this.Const.BodyPart.Head)
            {
                this.m.HeadblowLanded           += 1;
                this.m.LastHeadblowLanded       += 1;
                this.m.DamageDealtHeadHP        += _damageInflictedHitpoints;
                this.m.DamageDealtHelmet        += _damageInflictedArmor;
                this.m.LastDamageDealtHeadHP    += _damageInflictedHitpoints;
                this.m.LastDamageDealtHelmet    += _damageInflictedArmor;
            }
            else
            {
                this.m.DamageDealtBodyHP        += _damageInflictedHitpoints;
                this.m.DamageDealtArmor         += _damageInflictedArmor;
                this.m.LastDamageDealtBodyHP    += _damageInflictedHitpoints;
                this.m.LastDamageDealtArmor     += _damageInflictedArmor;
            }
        }
    }

    function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
    {
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
                    this.m.BeingMeleeAttack     += 1;
                    this.m.BeingMeleeLanded     += 1;
                    this.m.LastBeingMeleeAttack += 1;
                    this.m.LastBeingMeleeLanded += 1;
                }
                if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
                {
                    this.m.BeingRangeAttack     += 1;
                    this.m.BeingRangeLanded     += 1;
                    this.m.LastBeingRangeAttack += 1;
                    this.m.LastBeingRangeLanded += 1;
                }
            }
            else
            {
                this.m.BeingMeleeAttack     += 1;
                this.m.BeingMeleeLanded     += 1;
                this.m.LastBeingMeleeAttack += 1;
                this.m.LastBeingMeleeLanded += 1;
            }
            
            if(this.m.ReceiveDamageBodyPartThisSkill == this.Const.BodyPart.Head)
            {
                this.m.BeingHeadblowLanded      += 1;
                this.m.LastBeingHeadblowLanded  += 1;

                this.m.DamageReceiveHeadHP      += _damageHitpoints;
                this.m.DamageReceiveHelmet      += _damageArmor;

                this.m.LastDamageReceiveHeadHP  += _damageHitpoints;
                this.m.LastDamageReceiveHelmet  += _damageArmor;
            }
            else
            {
                this.m.DamageReceiveBodyHP      += _damageHitpoints;
                this.m.DamageReceiveArmor       += _damageArmor;

                this.m.LastDamageReceiveBodyHP  += _damageHitpoints;
                this.m.LastDamageReceiveArmor   += _damageArmor;
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
                    this.m.BeingMeleeAttack     += 1;
                    this.m.LastBeingMeleeAttack += 1;
                }
                if(item.isItemType(this.Const.Items.ItemType.RangedWeapon))
                {
                    this.m.BeingRangeAttack     += 1;
                    this.m.LastBeingRangeAttack += 1;
                }
            }
            else
            {
                this.m.BeingMeleeAttack     += 1;
                this.m.LastBeingMeleeAttack += 1;
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
        
        local kCurrentSavingVersion = 5;
        _out.writeU32(kCurrentSavingVersion);

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
        _out.writeU32(this.m.BeingHeadblowLanded);

        _out.writeU32(this.m.LastDamageDealtBodyHP);
        _out.writeU32(this.m.LastDamageDealtHeadHP);
        _out.writeU32(this.m.LastDamageDealtHelmet);
        _out.writeU32(this.m.LastDamageDealtArmor);
        _out.writeU32(this.m.LastMeleeAttack);
        _out.writeU32(this.m.LastMeleeLanded);
        _out.writeU32(this.m.LastRangeAttack);
        _out.writeU32(this.m.LastRangeLanded);
        _out.writeU32(this.m.LastHeadblowLanded);

        _out.writeU32(this.m.LastDamageReceiveHeadHP);
        _out.writeU32(this.m.LastDamageReceiveBodyHP);
        _out.writeU32(this.m.LastDamageReceiveHelmet);
        _out.writeU32(this.m.LastDamageReceiveArmor);
        _out.writeU32(this.m.LastBeingMeleeAttack);
        _out.writeU32(this.m.LastBeingMeleeLanded);
        _out.writeU32(this.m.LastBeingRangeAttack);
        _out.writeU32(this.m.LastBeingRangeLanded);
        _out.writeU32(this.m.LastBeingHeadblowLanded);

        _out.writeU32(this.m.ExecutionerPerkAttack);
        _out.writeU32(this.m.ExecutionerPerkLanded);

        _out.writeU32(this.m.NineLivesPerkActivated);
        
        _out.writeU32(this.m.FastAdaptionPerkAttack);
        _out.writeU32(this.m.FastAdaptionPerkLanded);
    }

    function onDeserialize( _in )
    {
        this.skill.onDeserialize(_in);

        local Version = _in.readU32();
        if(Version >= 4)
        {
            this.m.DamageDealtHeadHP        = _in.readU32();
            this.m.DamageDealtBodyHP        = _in.readU32();
            this.m.DamageDealtHelmet        = _in.readU32();
            this.m.DamageDealtArmor         = _in.readU32();
            this.m.MeleeAttack              = _in.readU32();
            this.m.MeleeLanded              = _in.readU32();
            this.m.RangeAttack              = _in.readU32();
            this.m.RangeLanded              = _in.readU32();
            this.m.HeadblowLanded           = _in.readU32();

            this.m.DamageReceiveHeadHP      = _in.readU32();
            this.m.DamageReceiveBodyHP      = _in.readU32();
            this.m.DamageReceiveHelmet      = _in.readU32();
            this.m.DamageReceiveArmor       = _in.readU32();
            this.m.BeingMeleeAttack         = _in.readU32();
            this.m.BeingMeleeLanded         = _in.readU32();
            this.m.BeingRangeAttack         = _in.readU32();
            this.m.BeingRangeLanded         = _in.readU32();
            this.m.BeingHeadblowLanded      = _in.readU32();

            this.m.LastDamageDealtBodyHP    = _in.readU32();
            this.m.LastDamageDealtHeadHP    = _in.readU32();
            this.m.LastDamageDealtHelmet    = _in.readU32();
            this.m.LastDamageDealtArmor     = _in.readU32();
            this.m.LastMeleeAttack          = _in.readU32();
            this.m.LastMeleeLanded          = _in.readU32();
            this.m.LastRangeAttack          = _in.readU32();
            this.m.LastRangeLanded          = _in.readU32();
            this.m.LastHeadblowLanded       = _in.readU32();

            this.m.LastDamageReceiveHeadHP  = _in.readU32();
            this.m.LastDamageReceiveBodyHP  = _in.readU32();
            this.m.LastDamageReceiveHelmet  = _in.readU32();
            this.m.LastDamageReceiveArmor   = _in.readU32();
            this.m.LastBeingMeleeAttack     = _in.readU32();
            this.m.LastBeingMeleeLanded     = _in.readU32();
            this.m.LastBeingRangeAttack     = _in.readU32();
            this.m.LastBeingRangeLanded     = _in.readU32();
            this.m.LastBeingHeadblowLanded  = _in.readU32();

            this.m.ExecutionerPerkAttack    = _in.readU32();
            this.m.ExecutionerPerkLanded    = _in.readU32();

            this.m.NineLivesPerkActivated   = _in.readU32();

            if(Version >= 5)
            {
                this.m.FastAdaptionPerkAttack = _in.readU32();
                this.m.FastAdaptionPerkLanded = _in.readU32();
            }
        }
        else if(Version >=2 && Version <= 3)
        {
            this.m.DamageDealtHeadHP        = _in.readU32();
            this.m.DamageDealtBodyHP        = _in.readU32();
            this.m.DamageDealtHelmet        = _in.readU32();
            this.m.DamageDealtArmor         = _in.readU32();
            this.m.MeleeAttack              = _in.readU32();
            this.m.MeleeLanded              = _in.readU32();
            this.m.RangeAttack              = _in.readU32();
            this.m.RangeLanded              = _in.readU32();
            this.m.HeadblowLanded           = _in.readU32();

            this.m.DamageReceiveHeadHP      = _in.readU32();
            this.m.DamageReceiveBodyHP      = _in.readU32();
            this.m.DamageReceiveHelmet      = _in.readU32();
            this.m.DamageReceiveArmor       = _in.readU32();
            this.m.BeingMeleeAttack         = _in.readU32();
            this.m.BeingMeleeLanded         = _in.readU32();
            this.m.BeingRangeAttack         = _in.readU32();
            this.m.BeingRangeLanded         = _in.readU32();
            this.m.BeingHeadblowLanded      = _in.readU32();

            this.m.ExecutionerPerkAttack    = _in.readU32();
            this.m.ExecutionerPerkLanded    = _in.readU32();

            this.m.NineLivesPerkActivated   = _in.readU32();

        }
        else if(Version >=1 && Version < 2)
        {
            this.m.DamageDealtBodyHP        = _in.readU32();
            this.m.DamageDealtArmor         = _in.readU32();
            this.m.MeleeAttack              = _in.readU32();
            this.m.MeleeLanded              = _in.readU32();
            this.m.RangeAttack              = _in.readU32();
            this.m.RangeLanded              = _in.readU32();
            
            this.m.DamageReceiveBodyHP      = _in.readU32();
            this.m.DamageReceiveArmor       = _in.readU32();
            this.m.BeingMeleeAttack         = _in.readU32();
            this.m.BeingMeleeLanded         = _in.readU32();
            this.m.BeingRangeAttack         = _in.readU32();
            this.m.BeingRangeLanded         = _in.readU32();

            this.m.ExecutionerPerkAttack    = _in.readU32();
            this.m.ExecutionerPerkLanded    = _in.readU32();

            this.m.NineLivesPerkActivated   = _in.readU32();    
        }
    }
});

