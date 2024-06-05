::KillingDetails <- {
    UniqueName    = "mod_killing_details",
    Version        = "5.5.0",
    Description = "Record Slained Enemies with MordenHook."
}

local mod = ::Hooks.register
(
    ::KillingDetails.UniqueName,
    ::KillingDetails.Version,
    ::KillingDetails.Description
);

::KillingDetails.TooltipText <- {
    SavedCoins        = "Saved [img]gfx/ui/tooltips/money.png[/img]%d golds.",
    FavoriteWeapon    = "His favorite weapon is %s."
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
});