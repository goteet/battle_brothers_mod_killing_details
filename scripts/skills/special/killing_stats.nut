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
		//this.m.IsStacking = true;
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
		
		local num_columns = 5;
		local description = false;

		local species_detail_texts = [];
		local killing_species_details = actor.getKillingSpeciesDetails();
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
			description = true;
		}

		local killing_remarkables = actor.getKillingRemarkables();
		local remarkable_low_texts = [];
		local remarkable_boss_texts = [];
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
			description = true;
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
			description = true;
		}

		local unique_text = "";
		for(local remarkable_index = this.Const.World.ERemarkable.Start_Unique; remarkable_index <= this.Const.World.ERemarkable.End_Unique; remarkable_index++)
		{
			if(killing_remarkables[remarkable_index] > 0 )
			{
				unique_text += "[img]gfx/ui/tooltips/orientation/" 
							+ this.Const.World.ERemarkable.Resources[remarkable_index]
							+ "[/img]  ";
			}
		}
		if(unique_text != "")
		{
			ret.push({ id = 50, type = "description", text = "The Legenary opponents he conquered:" });
			ret.push({ id = 51, type = "description", text = unique_text});
			description = true;
		}
		if(!description)
		{
			ret.push({ id = 2, type = "description", text = "He is too fresh to meet his destiny:" });
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

});

