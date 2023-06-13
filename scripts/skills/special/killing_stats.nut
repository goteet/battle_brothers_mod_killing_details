this.killing_stats <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "special.killing_stats";
		this.m.Name = "Killing Details";
		this.m.Description = "The Killing Detail Counter";
		this.m.Icon = "skills/killing_stats.png";
		this.m.IconMini = "";
		this.m.Order = this.Const.SkillOrder.Trait + 601;
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
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

		local actor = this.getContainer().getActor();

		local species_detail_texts = [];
		local remarkable_low_texts = [];
		local remarkable_boss_texts = [];
		local unique_text = "";
		local killing_species_details = actor.getKillingSpeciesDetails();
		local killing_remarkables = actor.getKillingRemarkables();
		for(local index = 0; index < this.Const.World.ESpeciesDetails.Num; index++)
		{
			if(killing_species_details[index] > 0 )
			{
				local text = "[img]gfx/ui/tooltips/orientation/" 
							+ this.Const.World.ESpeciesDetails.Resources[index] 
							+ "[/img] "
							+ killing_species_details[index];
				species_detail_texts.push(text);
			}
		}
		for(local remarkable_index = this.Const.World.ERemarkable.Start_Low; remarkable_index <= this.Const.World.ERemarkable.End_Low; remarkable_index++)
		{
			if(killing_remarkables[remarkable_index] > 0 )
			{
				local text = "[img]gfx/ui/tooltips/orientation/" 
							+ this.Const.World.ERemarkable.Resources[remarkable_index]
							+ "[/img] "
							+ killing_remarkables[remarkable_index];
				remarkable_low_texts.push(text);
			}
		}
		for(local remarkable_index = this.Const.World.ERemarkable.Start_Boss; remarkable_index <= this.Const.World.ERemarkable.End_Boss; remarkable_index++)
		{
			if(killing_remarkables[remarkable_index] > 0 )
			{
				local text = "[img]gfx/ui/tooltips/orientation/" 
							+ this.Const.World.ERemarkable.Resources[remarkable_index]
							+ "[/img] "
							+ killing_remarkables[remarkable_index];
				remarkable_boss_texts.push(text);
			}
		}
		for(local remarkable_index = this.Const.World.ERemarkable.Start_Unique; remarkable_index <= this.Const.World.ERemarkable.End_Unique; remarkable_index++)
		{
			if(killing_remarkables[remarkable_index] > 0 )
			{
				unique_text += "[img]gfx/ui/tooltips/orientation/" 
							+ this.Const.World.ERemarkable.Resources[remarkable_index]
							+ "[/img]  ";
			}
		}
		

		local time = actor.getDaysWithCompany();
		local battles = actor.m.LifetimeStats.Battles;
		local participate_text = "";
		if(battles > 0)
		{
			participate_text = "He participate " + battles + " battle";
			if(battles > 1)
			{
				participate_text += "s";
			}
			
			if(time > 1)
			{
				participate_text += " in " + time + " days";
			}
			else if(time < 1)
			{
				participate_text += " without hesitate when he just join in the company";
			}
			else
			{
				participate_text += " at the first day he join the company";
			}

			
			local has_any_kills = species_detail_texts.len() > 0 || remarkable_low_texts.len() > 0 || remarkable_boss_texts.len() > 0 || unique_text != "";
			if(has_any_kills)
			{
				participate_text += ".";
			}
			else
			{
				participate_text = ", but has no kills yet.";
			}
			ret.push({ id = 2, type = "description", text = participate_text });
		}
		else
		{
			if(time > 0)
			{
				participate_text = "He joined the company " + time + "days, but doing no kills yet.";
			}
			else
			{
				participate_text = "He is too fresh to meet his destiny.";
			}
			ret.push({ id = 2, type = "description", text = participate_text });
			return ret;
		}

		
		local num_columns = 5;
		if(species_detail_texts.len() > 0)
		{
			ret.push({ id = 20, type = "description", text = "The opponents he slained list here:" });
			local num_lines = (species_detail_texts.len() + num_columns - 1) / num_columns;
			for(local line_index = 0; line_index < num_lines; line_index += 1)
			{
				local line_text = "";
				for(local index = 0; index < num_columns; index += 1)
				{
					local text_index = line_index * num_columns + index;
					line_text += species_detail_texts[text_index];
					if(text_index == species_detail_texts.len() - 1)
					{
						line_text += "."; 
						break;
					}
					else
					{
						line_text += ","; 
					}
				}
				ret.push({ id = 20 + line_index, type = "description", text = line_text});
			}
		}

		if(remarkable_low_texts.len() > 0)
		{
			ret.push({ id = 30, type = "description", text = "The strong opponents he killed:" });
			local num_lines = (remarkable_low_texts.len() + num_columns - 1) / num_columns;
			for(local line_index = 0; line_index < num_lines; line_index += 1)
			{
				local line_text = "";
				for(local index = 0; index < num_columns; index += 1)
				{
					local text_index = line_index * num_columns + index;
					line_text += remarkable_low_texts[text_index];
					if(text_index == remarkable_low_texts.len() - 1)
					{
						line_text += "."; 
						break;
					}
					else
					{
						line_text += ","; 
					}
				}

				ret.push({ id = 30 + line_index, type = "description", text = line_text});
			}
		}

		if(remarkable_boss_texts.len() > 0)
		{
			ret.push({ id = 40, type = "description", text = "The Remarkable opponents he vanquished:" });
			local num_lines = (remarkable_low_texts.len() + num_columns - 1) / num_columns;
			for(local line_index = 0; line_index < num_lines; line_index += 1)
			{
				local line_text = "";
				for(local index = 0; index < num_columns; index += 1)
				{
					local text_index = line_index * num_columns + index;
					line_text += remarkable_boss_texts[text_index];
					if(text_index == remarkable_boss_texts.len() - 1)
					{
						line_text += "."; 
						break;
					}
					else
					{
						line_text += ","; 
					}
				}

				ret.push({ id = 40 + line_index, type = "description", text = line_text});
			}
		}

		
		if(unique_text != "")
		{
			ret.push({ id = 50, type = "description", text = "The Legenary opponents he conquered:" });
			ret.push({ id = 51, type = "description", text = unique_text});
		}
		return ret;
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		if (_targetEntity.getXPValue() > 0)
		{
			local actor = this.getContainer().getActor();
			local species_type = this.Const.World.ESpecies.fromEntityType(_targetEntity.getType());
			if(species_type < this.Const.World.ESpecies.Num)
			{
				local species = actor.getKillingSpecies();
				species[species_type] += 1;
			}

			local species_detail_type = this.Const.World.ESpeciesDetails.fromEntityType(_targetEntity.getType());
			if(species_detail_type < this.Const.World.ESpeciesDetails.Num)
			{
				local details = actor.getKillingSpeciesDetails();
				details[species_detail_type] += 1;
			}

			local remarkable_type = this.Const.World.ERemarkable.fromEntity( _targetEntity );
			if(remarkable_type < this.Const.World.ERemarkable.Num)
			{
				local remarkables = actor.getKillingRemarkables();
				remarkables[remarkable_type] += 1;
			}
		}
	}

	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if(item != null)
		{
			local weapon_stats = actor.getWeaponStats();
			local used_list = weapon_stats.UsedWeaponRecords;

			if(weapon_stats.CurrentUsedWeaponIndex == -1 || used_list[weapon_stats.CurrentUsedWeaponIndex].Name != item.getName())
			{
				weapon_stats.CurrentUsedWeaponIndex = -1;
				foreach(index, record in used_list)
				{
					if(record.Name == item.getName())
					{
						weapon_stats.CurrentUsedWeaponIndex = index;
						break;
					}
				}
			}

			if(weapon_stats.CurrentUsedWeaponIndex == -1)
			{
				local record = { Name = item.getName(), Count = 1 }; 
				used_list.push(record);
				weapon_stats.CurrentUsedWeaponIndex = used_list.len() - 1;
			}
			else
			{
				used_list[weapon_stats.CurrentUsedWeaponIndex].Count += 1;
			}

			if(weapon_stats.MostUsedWeaponIndex == -1)
			{
				local most_used_weapon_count = 0;
				foreach(index, record in weapon_stats.UsedWeaponRecords)
				{
					if(most_used_weapon_count < record.Count)
					{
						most_used_weapon_count = record.Count;
						weapon_stats.MostUsedWeaponIndex = index;
					}
				}
				weapon_stats.MostUsedWeaponIndex = weapon_stats.CurrentUsedWeaponIndex;
			}
			else if(weapon_stats.CurrentUsedWeaponIndex != weapon_stats.MostUsedWeaponIndex)
			{
				local most_used = used_list[weapon_stats.MostUsedWeaponIndex];
				local curr_used = used_list[weapon_stats.CurrentUsedWeaponIndex];

				if(most_used.Count < curr_used.Count)
				{
					weapon_stats.MostUsedWeaponIndex = weapon_stats.CurrentUsedWeaponIndex;
				}
			}
		}
	}

});

