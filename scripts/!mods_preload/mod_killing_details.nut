local detail_mod_version = 1;

::mods_registerMod("mod_killing_details",  detail_mod_version, "Record Slained Remarkable Enemies");



::mods_queue("mod_killing_details", null, function() 
{
	local ESpecies = 
	{
		Humen = 0,
		Greenskins = 1,
		Undeads = 2,
		Beasts = 3,
		Witches = 4,
		Num = 5,
		Names =
		[
			"Human", "Humen",
			"Greenskin", "Greenskins",
			"Undead", "Undead things",
			"Beast", "Beasts",
			"Witch", "Witches"
		],
		function fromEntityType( _type )
		{
			switch(_type)
			{
				case this.Const.EntityType.Necromancer:
				case this.Const.EntityType.Hexe:
					return this.Witches;

				case this.Const.EntityType.Zombie:
				case this.Const.EntityType.ZombieYeoman:
				case this.Const.EntityType.ZombieKnight:
				case this.Const.EntityType.ZombieBetrayer:
				case this.Const.EntityType.ZombieBoss:
				case this.Const.EntityType.ZombieTreasureHunter:
					return this.Undeads;

				case this.Const.EntityType.SkeletonLight:
				case this.Const.EntityType.SkeletonMedium:
				case this.Const.EntityType.SkeletonHeavy:
				case this.Const.EntityType.SkeletonPriest:
				case this.Const.EntityType.SkeletonBoss:
				case this.Const.EntityType.Vampire:
				case this.Const.EntityType.Ghost:
				case this.Const.EntityType.SkeletonLich:
				case this.Const.EntityType.SkeletonLichMirrorImage:
				case this.Const.EntityType.FlyingSkull:
				case this.Const.EntityType.SkeletonPhylactery:
					return this.Undeads;

				case this.Const.EntityType.OrcYoung:
				case this.Const.EntityType.OrcBerserker:
				case this.Const.EntityType.OrcWarrior:
				case this.Const.EntityType.OrcWarlord:
					return this.Greenskins;

				case this.Const.EntityType.Militia:
				case this.Const.EntityType.MilitiaRanged:
				case this.Const.EntityType.MilitiaVeteran:
				case this.Const.EntityType.MilitiaCaptain:
				case this.Const.EntityType.Peasant:
				case this.Const.EntityType.CaravanHand:
				case this.Const.EntityType.CaravanGuard:
					return this.Humen;

				case this.Const.EntityType.Footman:
				case this.Const.EntityType.Greatsword:
				case this.Const.EntityType.Billman:
				case this.Const.EntityType.Arbalester:
				case this.Const.EntityType.StandardBearer:
				case this.Const.EntityType.Sergeant:
				case this.Const.EntityType.Knight:
					return this.Humen;

				case this.Const.EntityType.BountyHunter:
				case this.Const.EntityType.Mercenary:
				case this.Const.EntityType.MercenaryRanged:
				case this.Const.EntityType.Swordmaster:
				case this.Const.EntityType.HedgeKnight:
				case this.Const.EntityType.MasterArcher:
				case this.Const.EntityType.Cultist:
				case this.Const.EntityType.Oathbringer:
					return this.Humen;

				case this.Const.EntityType.BanditThug:
				case this.Const.EntityType.BanditPoacher:
				case this.Const.EntityType.BanditMarksman:
				case this.Const.EntityType.BanditRaider:
				case this.Const.EntityType.BanditLeader:
					return this.Humen;

				case this.Const.EntityType.GoblinAmbusher:
				case this.Const.EntityType.GoblinFighter:
				case this.Const.EntityType.GoblinLeader:
				case this.Const.EntityType.GoblinShaman:
				case this.Const.EntityType.GoblinWolfrider:
					return this.Greenskin;

				case this.Const.EntityType.MilitaryDonkey:
				case this.Const.EntityType.CaravanDonkey:
				case this.Const.EntityType.Wardog:
				case this.Const.EntityType.Warhound:
				case this.Const.EntityType.ArmoredWardog:
				case this.Const.EntityType.Wolf:
				case this.Const.EntityType.BarbarianUnhold:
					return this.Beasts;

				case this.Const.EntityType.Ghoul:
				case this.Const.EntityType.Direwolf:
				case this.Const.EntityType.Lindwurm:
				case this.Const.EntityType.Unhold:
				case this.Const.EntityType.UnholdFrost:
				case this.Const.EntityType.UnholdBog:
				case this.Const.EntityType.Spider:
				case this.Const.EntityType.SpiderEggs:
				case this.Const.EntityType.Alp:
				case this.Const.EntityType.Schrat:
				case this.Const.EntityType.SchratSmall:
				case this.Const.EntityType.Kraken:
				case this.Const.EntityType.KrakenTentacle:
				case this.Const.EntityType.AlpShadow:
				case this.Const.EntityType.TricksterGod:
				case this.Const.EntityType.Serpent:
				case this.Const.EntityType.SandGolem:
				case this.Const.EntityType.Hyena:
					return this.Beasts;

				case this.Const.EntityType.Wildman:
				case this.Const.EntityType.BarbarianThrall:
				case this.Const.EntityType.BarbarianMarauder:
				case this.Const.EntityType.BarbarianChampion:
				case this.Const.EntityType.BarbarianDrummer:
				case this.Const.EntityType.BarbarianBeastmaster:
				case this.Const.EntityType.BarbarianUnholdFrost:
				case this.Const.EntityType.BarbarianChosen:
				case this.Const.EntityType.BarbarianMadman:
					return this.Humen;

				case this.Const.EntityType.Conscript:
				case this.Const.EntityType.Gunner:
				case this.Const.EntityType.Officer:
				case this.Const.EntityType.Engineer:
				case this.Const.EntityType.Assassin:
				case this.Const.EntityType.Slave:
				case this.Const.EntityType.Gladiator:
				case this.Const.EntityType.Mortar:
				case this.Const.EntityType.PeasantSouthern:
					return this.Humen;

				case this.Const.EntityType.NomadCutthroat:
				case this.Const.EntityType.NomadOutlaw:
				case this.Const.EntityType.NomadSlinger:
				case this.Const.EntityType.NomadArcher:
				case this.Const.EntityType.NomadLeader:
				case this.Const.EntityType.DesertStalker:
				case this.Const.EntityType.Executioner:
				case this.Const.EntityType.DesertDevil:
					return this.Humen;

				case this.Const.EntityType.GreenskinCatapult:
					return this.Num;
			}
			return this.Num;
		}	
	};

	local ERemarkable = 
	{
		BanditBoss = 0,
		NomadBoss = 1,
		BarbarianBoss = 2,
		GoblinBoss = 3,
		GoblinShaman = 4,
		GoblinOverseer = 5,
		OrcBoss = 6,
		ZombieBoss = 7,
		SkeletonBoss = 8,
		Geist = 9,
		Vampire = 10,
		HedgeKnight = 11,
		Officer = 12,
		Gladiator = 13
		Swordmaster = 14,
		MasterArcher = 15,
		Executioner = 16,
		Assassin = 17,
		Lv3Ghoul = 18,
		Lv3Sandgolem = 19,
		Unhold = 20,
		Nightmare = 21,
		Lindwurm = 22,
		Schrat = 23,
		Necromancers = 24,
		Hexes = 25,
		Num = 26,
		
		Resources = 
		[
			"bandit_boss.png",
			"nomad_boss.png",
			"barb_boss.png",
			"goblin_boss.png",
			"goblin_shaman.png",
			"goblin_overseer.png",
			"orc_boss.png",
			"zombie_boss.png",
			"skeleton_boss.png",
			"geist.png",
			"vampire.png",
			"hedge_knight.png",
			"officer.png",
			"gladiator.png",
			"sword_master.png",
			"master_archer.png",
			"executioner.png",
			"assassin.png",
			"lv3_ghoul.png",
			"lv3_sand_golem.png",
			"unhold.png",
			"nightmare.png",
			"lindwurm.png",
			"schrat.png",
			"necromancer.png",
			"hexe.png"
		],

		function fromEntity( _entity )
		{
			local _type = _entity.getType();
			switch(_type)
			{
				case this.Const.EntityType.BanditLeader:
					if(_entity.m.IsMiniboss)
					{
						return this.BanditBoss;
					}
					break;
					
				case this.Const.EntityType.NomadLeader:
				case this.Const.EntityType.DesertStalker:
				case this.Const.EntityType.DesertDevil:
					if(_entity.m.IsMiniboss)
					{
						return this.NomadBoss;
					}
					break;
					
				case this.Const.EntityType.BarbarianChosen:
				case this.Const.EntityType.BarbarianChampion:
					if(_entity.m.IsMiniboss)
					{
						return this.BarbarianBoss;
					}
					break;

				case this.Const.EntityType.BarbarianMadman:
					return this.BarbarianBoss;
					
				case this.Const.EntityType.GoblinAmbusher:
				case this.Const.EntityType.GoblinFighter:
					if(_entity.m.IsMiniboss)
					{
						return this.GoblinBoss;
					}
					break;
					
				case this.Const.EntityType.GoblinShaman:
					return this.GoblinShaman;

				case this.Const.EntityType.GoblinLeader:
					return this.GoblinOverseer;
					
				case this.Const.EntityType.OrcWarrior:
				case this.Const.EntityType.OrcWarlord:
					if(_entity.m.IsMiniboss)
					{
						return this.OrcBoss;
					}
					break;
					
				case this.Const.EntityType.ZombieKnight:
					if(_entity.m.IsMiniboss)
					{
						return this.ZombieBoss;
					}
					break;

				case this.Const.EntityType.ZombieBoss:
					return this.ZombieBoss;

				case this.Const.EntityType.SkeletonHeavy:
				case this.Const.EntityType.SkeletonPriest:
					if(_entity.m.IsMiniboss)
					{
						return this.SkeletonBoss;
					}
					break;
				
				case this.Const.EntityType.SkeletonLich:
					return this.SkeletonBoss;

				case this.Const.EntityType.Ghost:
					return this.Geist;

				case this.Const.EntityType.Vampire:
					return this.Vampire;

				case this.Const.EntityType.Knight:
				case this.Const.EntityType.HedgeKnight:
				case this.Const.EntityType.Oathbringer:
					return this.HedgeKnight;

				case this.Const.EntityType.Officer:
					return this.Officer;

				case this.Const.EntityType.Gladiator:
					return this.Gladiator;

				case this.Const.EntityType.Swordmaster:
					return this.Swordmaster;

				case this.Const.EntityType.MasterArcher:
					return this.MasterArcher;

				case this.Const.EntityType.Executioner:
					return this.Executioner;

				case this.Const.EntityType.Assassin:
					return this.Assassin;

				case this.Const.EntityType.Ghoul:
					if(_entity.getSize() == 3)
					{
						return this.Lv3Ghoul;
					}
					break;

				case this.Const.EntityType.SandGolem:
					if(_entity.getSize() == 3)
					{
						return this.Lv3Sandgolem;
					}
					break;

				case this.Const.EntityType.Unhold:
				case this.Const.EntityType.UnholdFrost:
				case this.Const.EntityType.BarbarianUnhold:
				case this.Const.EntityType.BarbarianUnholdFrost:
				case this.Const.EntityType.UnholdBog:
					return this.Unhold;

				case this.Const.EntityType.Alp:
				case this.Const.EntityType.AlpShadow:
					return this.Nightmare;

				case this.Const.EntityType.Lindwurm:
					return this.Lindwurm;

				case this.Const.EntityType.Schrat:
					return this.Schrat;
					
				case this.Const.EntityType.Necromancer:
					return this.Necromancers;
				
				case this.Const.EntityType.Hexe:
					return this.Hexes;

				case this.Const.EntityType.Kraken:
				case this.Const.EntityType.SkeletonBoss:
					//TODO: add special token.
			}
			return this.Num;
		}
	};

	::mods_hookExactClass("entity/tactical/player", function(player) 
	{
		///
		// New fields, those accessors and Save/Load
		///
        ::mods_addField(player, "player", "DetailStats", 
			{
				KillingStats = 
				{
					Species = [],
					Remarkables = [],
				},
				SavedGolds = 0,
			}
		);

		::mods_addMember(player, "player", "getKillingStats", function ()
			{
				return this.m.DetailStats.KillingStats;
			}
		);

		::mods_addMember(player, "player", "getKillingSpecies", function ()
			{
				return this.m.DetailStats.KillingStats.Species;
			}
		);

		::mods_addMember(player, "player", "getKillingRemarkables", function ()
			{
				return this.m.DetailStats.KillingStats.Remarkables;
			}
		);

		::mods_addMember(player, "player", "getSavedGolds", function ()
			{
				return this.m.DetailStats.SavedGolds;
			}
		);

		local onInit = ::mods_getMember(player, "onInit");
		::mods_override(player, "onInit", function()
		{
			onInit();
			local killing_species = this.getKillingSpecies();
			local killing_remarkables = this.getKillingRemarkables();

			killing_species.resize(ESpecies.Num);
			killing_remarkables.resize(ERemarkable.Num);

			for(local index = 0; index < ESpecies.Num; index++)
			{
				killing_species[index] = 0;
			}

			for(local index = 0; index < ERemarkable.Num; index++)
			{
				killing_remarkables[index] = 0;
			}
		});


		local onSerialize = ::mods_getMember(player, "onSerialize");
		::mods_override(player, "onSerialize", function( _out )
		{
			onSerialize(_out);

			_out.writeU32(detail_mod_version);
			_out.writeU32(player.m.DetailStats.SavedGolds);
			local killing_species = this.getKillingSpecies();
			for(local index = 0; index < ESpecies.Num; index++)
			{
				_out.writeU32(killing_species[index]);
			}

			local killing_remarkables = this.getKillingRemarkables();
			for(local index = 0; index < ERemarkable.Num; index++)
			{
				_out.writeU32(killing_remarkables[index]);
			}
		});

	
		local onDeserialize = ::mods_getMember(player, "onDeserialize");
		::mods_override(player, "onDeserialize", function( _in )
		{
			onDeserialize(_in);
			local saved_detail_mod_version = _in.readU32();
			if(saved_detail_mod_version == 1)
			{
				this.m.DetailStats.SavedGolds = _in.readU32();
				
				local killing_species = this.getKillingSpecies();
				local killing_remarkables = this.getKillingRemarkables();
				killing_species.resize(ESpecies.Num)
				killing_remarkables.resize(ERemarkable.Num)

				for(local index = 0; index < ESpecies.Num; index++)
				{
					killing_species[index] = _in.readU32();
				}
				for(local index = 0; index < ERemarkable.Num; index++)
				{
					killing_remarkables[index] = _in.readU32();
				}
			}
		});


		///
		// Formated Display UI.
		///
		local getRosterTooltip = ::mods_getMember(player, "getRosterTooltip");
		local getRosterTooltip_ = function()
		{
			local tooltips = getRosterTooltip();
			local killing_species = this.getKillingSpecies();
			local killing_remarkables = this.getKillingRemarkables();

			local postfix = "";
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
						local detail_text = ".";
						local index_start = 0;
						local index_end = ESpecies.Num - 1;
						while(index_start < ESpecies.Num && killing_species[index_start] == 0)
						{
							index_start++;
						}
						while(index_end > index_start && killing_species[index_end] == 0)
						{
							index_end--;
						}
						if(index_start < ESpecies.Num)
						{
							detail_text = ", including " 
										+ killing_species[index_start] 
										+ " " 
										+ ESpecies.Names[(killing_species[index_start] == 1 ? index_start*2 : index_start*2+1)];
							
							if(index_start != index_end)
							{
								for(index_start++; index_start < index_end; index_start++)
								{
									if(killing_species[index_start] > 0)
									{
										detail_text += ", "
													+ killing_species[index_start] + " " 
													+ ESpecies.Names[(killing_species[index_start] == 1 ? index_start*2 : index_start*2+1)];
														
									}
								}

								detail_text += " and "
											+ killing_species[index_start] + " " 
											+ ESpecies.Names[(killing_species[index_start] == 1 ? index_start*2 : index_start*2+1)]
											+ ".";
							}
							else
							{
								detail_text += ".";
							}
						}
						local rest = object.text.slice(index_num_kills + find_str.len());
						object.text = object.text.slice(0, index_num_kills + find_str.len() - 1) + detail_text +  rest;
					}
				}
				array_index++;
			}

			local remarkable_lines = 0;
			local remarkable_list_text = "";
			local remarkable_list_count = 0;
			local num_columns = 5;
			
			for(local remarkable_index = 0; remarkable_index < ERemarkable.Num; remarkable_index++)
			{
				if(killing_remarkables[remarkable_index] > 0 )
				{
					if(remarkable_list_count % num_columns != 0)
					{
						remarkable_list_text += ", "
					}
					remarkable_list_text += "[img]gfx/ui/tooltips/orientation/" + ERemarkable.Resources[remarkable_index] + "[/img] "
											+ killing_remarkables[remarkable_index];
					remarkable_list_count++;
					if(remarkable_list_count % num_columns == 0)
					{
						if(remarkable_lines == 0)
						{
							tooltips.push({ id = 21, type = "description", text = "Remarkable opponents he vanquished:" });	
						}
						tooltips.push({ id = 21 + remarkable_list_count/num_columns, type = "description", text = remarkable_list_text});
						remarkable_lines++;
						remarkable_list_text = "";
					}
				}
			}

			if(remarkable_list_text != "" && remarkable_list_count % num_columns != 0)
			{
				if(remarkable_lines == 0)
				{
					tooltips.push({ id = 21, type = "description", text = "Remarkable opponents he vanquished:" });	
				}
				tooltips.push({ id = 21 + (remarkable_list_count+num_columns-1)/num_columns, type = "description", text = remarkable_list_text});
			}

			local saved = this.getSavedGolds();
			if(saved > 0)
			{
				local saved_golds_desc = "Saved [img]gfx/ui/tooltips/money.png[/img] " + saved + " golds .";
				local saved_golds_desc_item = { id = 35, type = "text", icon = "ui/icons/asset_money.png", text = saved_golds_desc };
				if(daili_cost_index == -1)
				{
					tooltips.push(saved_golds_desc_item);
				}
				else
				{
					tooltips.insert(daili_cost_index, saved_golds_desc_item);
				}
			}
			return tooltips;
		};
		
		::mods_override(player, "getRosterTooltip", getRosterTooltip_);
    });


	///
	// Accumulate Saved Golds
	///
	::mods_hookNewObjectOnce("states/world/asset_manager", function(assetManger)
	{
		local update = ::mods_getMember(assetManger, "update");
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
						bro.m.DetailStats.SavedGolds += bro.getDailyCost();
					}
				}
			}
			update( _worldState );
		}
		::mods_override(assetManger, "update", update_);
	});

	///
	// Accumulate Remarkable Counts
	///
	::mods_hookNewObject("skills/special/stats_collector", function(collector)
	{
		local onTargetKilled = ::mods_getMember(collector, "onTargetKilled");
		local onTargetKilled_ = function( _targetEntity, _skill )
		{
			if (_targetEntity.getXPValue() > 0)
			{
				local actor = this.getContainer().getActor();
				local species_type = ESpecies.fromEntityType(_targetEntity.getType());
				if(species_type < ESpecies.Num)
				{
					local species = actor.getKillingSpecies();
					species[species_type] += 1;
				}

				local remarkable_type = ERemarkable.fromEntity( _targetEntity );
				if(remarkable_type < ERemarkable.Num)
				{
					local remarkables = actor.getKillingRemarkables();
					remarkables[remarkable_type] += 1;
				}
			}

			onTargetKilled( _targetEntity, _skill );
		}

		::mods_override(collector, "onTargetKilled", onTargetKilled_);
	});
});