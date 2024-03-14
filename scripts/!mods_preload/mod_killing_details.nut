::mods_registerMod("mod_killing_details", 4, "Record Slained Remarkable Enemies");

::mods_queue("mod_killing_details", null, function() 
{
	::mods_hookExactClass("entity/tactical/player", function(player) 
	{
		local setStartValuesEx = ::mods_getMember(player, "setStartValuesEx");
		::mods_override(player, "setStartValuesEx", function(_backgrounds, _addTraits = true)
		{
			setStartValuesEx(_backgrounds, _addTraits);
			this.m.Skills.add(this.new("scripts/skills/special/killing_stats"));
			this.m.Skills.add(this.new("scripts/skills/special/battling_stats"));
		});

		local getRosterTooltip = ::mods_getMember(player, "getRosterTooltip");
		::mods_override(player, "getRosterTooltip", function()
		{
			local tooltips = getRosterTooltip();
			local skill = this.m.Skills.getSkillByID("special.killing_stats");
			if(skill != null)
			{
				local killing_species = skill.m.KillingStats.Species;

				local array_index = 0;
				local daili_cost_index = -1;
				foreach(object in tooltips)
				{
					if(object.id == 4)
					{
						daili_cost_index = array_index;
					}
					else if(object.id == 2)
					{
						//insert killing species details.
						local single_kill = this.m.LifetimeStats.Kills == 1;
						local find_str = single_kill ? " kill." : " kills.";
						local index_num_kills = object.text.find(find_str)
						if(index_num_kills != null)
						{
							local detail_text = skill.getKillingDetalsText();
							local rest = object.text.slice(index_num_kills + find_str.len());
							object.text = object.text.slice(0, index_num_kills + find_str.len() - 1) + detail_text +  rest;
						}
					}
					array_index++;
				}

				local saved = skill.m.SavedGolds;
				if(saved > 0)
				{
					local saved_golds_desc = format("Saved [img]gfx/ui/tooltips/money.png[/img]%d golds.", saved);
					local saved_golds_desc_item = { id = 70, type = "text", icon = "ui/icons/asset_money.png", text = saved_golds_desc };
					if(daili_cost_index == -1)
					{
						tooltips.push(saved_golds_desc_item);
					}
					else
					{
						tooltips.insert(daili_cost_index, saved_golds_desc_item);
					}
				}

				local weapon_stats = skill.m.WeaponStats;
				if(weapon_stats.MostUsedWeaponIndex != -1)
				{
					local weapon_name = weapon_stats.UsedWeaponRecords[weapon_stats.MostUsedWeaponIndex].Name;
					local saved_golds_desc_item = { id = 40, type = "description", text = format("His favorite weapon is %s.", weapon_name)};
					tooltips.push(saved_golds_desc_item);
				}
			}
			return tooltips;
		});

		local onDeserialize = ::mods_getMember(player, "onDeserialize");
		::mods_override(player, "onDeserialize", function(_in)
		{
			onDeserialize(_in);
			if(!this.m.Skills.getSkillByID("special.killing_stats"))
			{
				this.m.Skills.add(this.new("scripts/skills/special/killing_stats"));
			}

			if(!this.m.Skills.getSkillByID("special.battling_stats"))
			{
				this.m.Skills.add(this.new("scripts/skills/special/battling_stats"));
			}
		});
    });


	///
	// Accumulate Saved Golds
	///
	::mods_hookNewObjectOnce("states/world/asset_manager", function(assetManager)
	{
		local update = ::mods_getMember(assetManager, "update");
		local update_ = function( _worldState )
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
			update( _worldState );
		}
		::mods_override(assetManager, "update", update_);
	});
});