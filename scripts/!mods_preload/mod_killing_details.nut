::KillingDetails <- {
    UniqueName  = "mod_killing_details",
    Version     = "5.6.0",
    Description = "Record Slained Enemies with MordenHook."
}

local mod = ::Hooks.register
(
    ::KillingDetails.UniqueName,
    ::KillingDetails.Version,
    ::KillingDetails.Description
);

::KillingDetails.TooltipText <- {
    SavedCoins        = "从战队里一共领取了[img]gfx/ui/tooltips/money.png[/img]%d枚金币。",
    FavoriteWeapon    = "他最趁手的兵器是%s。"
}

::KillingDetails.HitchanceHook <- {

    bAttackTacticLog = false,
    
    Chance = 0,
    Rolled = 0,

    function ExtractTacticLog(_text)
    {
        this.Chance = 0;
        this.Rolled = 0;
        if (this.bAttackTacticLog)
        {
            local textChance = " (Chance: ";
            local textRolled = ", Rolled: ";
            local textRolledEnd = ")";

            local findChanceIndex = _text.find(textChance);
            local findRolledIndex = _text.find(textRolled);

            if(findChanceIndex != null && findRolledIndex != null)
            {
                local textRolledEndIndex = _text.find(textRolledEnd, findRolledIndex);
                if(textRolledEndIndex != null)
                {
                    local chance = _text.slice(findChanceIndex + textChance.len(), findRolledIndex);
                    local rolled = _text.slice(findRolledIndex + textRolled.len(), textRolledEndIndex);
                    this.Chance = chance.tointeger();
                    this.Rolled = rolled.tointeger();
                }
            }
        }
    }

}

mod.queue(function()
{
    mod.hook("scripts/entity/tactical/player", function(q) 
    {
        q.setStartValuesEx = @(__original) function(_backgrounds, _addTraits = true)
        {
            __original(_backgrounds, _addTraits);
            this.m.Skills.add(this.new("scripts/skills/special/killing_stats"));
            this.m.Skills.add(this.new("scripts/skills/special/battling_stats"));
        }

        q.onDeserialize = @(__original) function(_in)
        {
            __original(_in);
            if(!this.m.Skills.getSkillByID("special.killing_stats"))
            {
                this.m.Skills.add(this.new("scripts/skills/special/killing_stats"));
            }

            if(!this.m.Skills.getSkillByID("special.battling_stats"))
            {
                this.m.Skills.add(this.new("scripts/skills/special/battling_stats"));
            }
        };

        q.getRosterTooltip = @(__original) function()
        {
            local tooltips = __original();
            local skill = this.m.Skills.getSkillByID("special.killing_stats");
            if(skill != null)
            {
                local killing_species = skill.m.KillingStats.Species;

                local index = 0;
                local dailyCostDescIndex = -1;
                foreach(object in tooltips)
                {
                    if(object.id == 4)
                    {
                        dailyCostDescIndex = index;
                    }
                    else if(object.id == 2)
                    {
                        //insert killing species details.
                        local bIsSingleKill = this.m.LifetimeStats.Kills == 1;
                        local find_str = bIsSingleKill ? " kill." : " kills.";
                        local indexNumKills = object.text.find(find_str)
                        if(indexNumKills != null)
                        {
                            local killingDetailText = skill.getKillingDetalsText();
                            local rest = object.text.slice(indexNumKills + find_str.len());
                            object.text = object.text.slice(0, indexNumKills + find_str.len() - 1) + killingDetailText +  rest;
                        }
                    }
                    ++index;
                }

                if(skill.m.SavedGolds > 0)
                {
                    local text = format(::KillingDetails.TooltipText.SavedCoins, skill.m.SavedGolds);
                    local savedCoinsDesc = { id = 70, type = "text", icon = "ui/icons/asset_money.png", text = text };
                    if(dailyCostDescIndex == -1)
                    {
                        tooltips.push(savedCoinsDesc);
                    }
                    else
                    {
                        tooltips.insert(dailyCostDescIndex, savedCoinsDesc);
                    }
                }

                local weaponStats = skill.m.WeaponStats;
                if(weaponStats.MostUsedWeaponIndex != -1)
                {
                    local weaponName = weaponStats.UsedWeaponRecords[weaponStats.MostUsedWeaponIndex].Name;
                    local text = format(::KillingDetails.TooltipText.FavoriteWeapon, weaponName);
                    local favoriteWeaponDesc = { id = 40, type = "description", text = text};
                    tooltips.push(favoriteWeaponDesc);
                }
            }
            return tooltips;
        };
    });

    // Accumulate Saved Golds
    mod.hook("scripts/states/world/asset_manager", function(q)
    {
        q.update = @(__original) function( _worldState )
        {
            if (this.World.getTime().Days > this.m.LastDayPaid && this.World.getTime().Hours > 8 && this.m.IsConsumingAssets)
            {
                local roster = this.World.getPlayerRoster().getAll();
                local spend_money = 0;
                foreach( bro in roster )
                {
                    if (bro.getDailyCost() > 0 && this.m.Money > spend_money)
                    {
                        spend_money += bro.getDailyCost();
                        local skill = bro.m.Skills.getSkillByID("special.killing_stats");
                        skill.m.SavedGolds += bro.getDailyCost();
                    }
                }
            }
            __original( _worldState );
        }
    });

    // Hit Chance Extract
    mod.hook("scripts/ui/screens/tactical/modules/topbar/tactical_screen_topbar_event_log", function(q)
    {
        q.logEx = @(__original) function(_text)
        {
            ::KillingDetails.HitchanceHook.ExtractTacticLog(_text);
            return __original(_text);
        }
    });
    mod.hook("scripts/skills/skill", function(q)
    {
        q.attackEntity = @(__original) function( _user, _targetEntity, _allowDiversion = true )
        {
            ::KillingDetails.HitchanceHook.bAttackTacticLog = true;
            local r = __original( _user, _targetEntity, _allowDiversion);
            ::KillingDetails.HitchanceHook.bAttackTacticLog = false;
            return r;
        }
    });
});