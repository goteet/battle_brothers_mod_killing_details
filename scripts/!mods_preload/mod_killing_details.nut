local detail_mod_version = 2;

::mods_registerMod("mod_killing_details",  detail_mod_version, "Record Slained Remarkable Enemies");


local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

gt.Const.World.ESpecies <-
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
				return this.Greenskins;

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

gt.Const.World.ESpeciesDetails <-
{
	Bandits = 0,
	Mercenaries = 1,
	NobleArmies = 2,
	Nomads = 3,
	SouthernArmies = 4,
	Barbarians = 5,
	Goblins = 6,
	Orcs = 7,
	Zombies = 8,
	Skeletons = 9,
	Spiders = 10,
	Ghouls = 11,
	Puppets  = 12,
	Snakes = 13,
	SandGolems = 14,
	Num = 15,

	Resources = 
	[
		"bandits.png",
		"mercenaries.png",
		"noble_armies.png",
		"nomads.png",
		"southern_armies.png",
		"barbarians.png",
		"goblins.png",
		"orcs.png",
		"zombies.png",
		"skeletons.png",
		"spiders.png",
		"ghouls.png",
		"puppets.png",
		"snakes.png",
		"sand_golems.png"
	],

	function fromEntityType( _type )
	{
		switch(_type)
		{
			case this.Const.EntityType.BanditThug:
			case this.Const.EntityType.BanditPoacher:
			case this.Const.EntityType.BanditMarksman:
			case this.Const.EntityType.BanditRaider:
			case this.Const.EntityType.BanditLeader:
				return this.Bandits;

			case this.Const.EntityType.BountyHunter:
			case this.Const.EntityType.Mercenary:
			case this.Const.EntityType.MercenaryRanged:
			case this.Const.EntityType.HedgeKnight:
			case this.Const.EntityType.Swordmaster:
			case this.Const.EntityType.MasterArcher:
				return this.Mercenaries;

			case this.Const.EntityType.Militia:
			case this.Const.EntityType.MilitiaRanged:
			case this.Const.EntityType.MilitiaVeteran:
			case this.Const.EntityType.MilitiaCaptain:
			case this.Const.EntityType.Footman:
			case this.Const.EntityType.Greatsword:
			case this.Const.EntityType.Billman:
			case this.Const.EntityType.Arbalester:
			case this.Const.EntityType.StandardBearer:
			case this.Const.EntityType.Sergeant:
			case this.Const.EntityType.Knight:
			case this.Const.EntityType.Oathbringer:
				return this.NobleArmies;

			case this.Const.EntityType.NomadCutthroat:
			case this.Const.EntityType.NomadOutlaw:
			case this.Const.EntityType.NomadSlinger:
			case this.Const.EntityType.NomadArcher:
			case this.Const.EntityType.NomadLeader:
			case this.Const.EntityType.DesertStalker:
			case this.Const.EntityType.Executioner:
			case this.Const.EntityType.DesertDevil:
				return this.Nomads;

			case this.Const.EntityType.Conscript:
			case this.Const.EntityType.Gunner:
			case this.Const.EntityType.Officer:
			case this.Const.EntityType.Engineer:
			case this.Const.EntityType.Assassin:
			case this.Const.EntityType.Slave:
			case this.Const.EntityType.Gladiator:
			case this.Const.EntityType.Mortar:
				return this.SouthernArmies;

			case this.Const.EntityType.Wildman:
			case this.Const.EntityType.BarbarianThrall:
			case this.Const.EntityType.BarbarianMarauder:
			case this.Const.EntityType.BarbarianChampion:
			case this.Const.EntityType.BarbarianDrummer:
			case this.Const.EntityType.BarbarianBeastmaster:
			case this.Const.EntityType.BarbarianUnholdFrost:
			case this.Const.EntityType.BarbarianChosen:
			case this.Const.EntityType.BarbarianMadman:
				return this.Barbarians;

			case this.Const.EntityType.GoblinAmbusher:
			case this.Const.EntityType.GoblinFighter:
			case this.Const.EntityType.GoblinLeader:
			case this.Const.EntityType.GoblinShaman:
			case this.Const.EntityType.GoblinWolfrider:
				return this.Goblins;

			case this.Const.EntityType.OrcYoung:
			case this.Const.EntityType.OrcBerserker:
			case this.Const.EntityType.OrcWarrior:
			case this.Const.EntityType.OrcWarlord:
				return this.Orcs;

			case this.Const.EntityType.Zombie:
			case this.Const.EntityType.ZombieYeoman:
			case this.Const.EntityType.ZombieKnight:
			case this.Const.EntityType.ZombieBetrayer:
			case this.Const.EntityType.ZombieBoss:
			case this.Const.EntityType.ZombieTreasureHunter:
				return this.Zombies;

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
				return this.Skeletons;
				
			case this.Const.EntityType.Spider:
			case this.Const.EntityType.SpiderEggs:
				return this.Spiders;

			case this.Const.EntityType.Ghoul:
				return this.Ghouls;

			case this.Const.EntityType.Wolf:
			case this.Const.EntityType.Direwolf:
			case this.Const.EntityType.Hyena:
			case this.Const.EntityType.Wardog:
			case this.Const.EntityType.Warhound:
			case this.Const.EntityType.ArmoredWardog:
				return this.Puppets;
				
			case this.Const.EntityType.Serpent:
				return this.Snakes;
			case this.Const.EntityType.SandGolem:
				return this.SandGolems;
		}
		return this.Num;
	}	
}

gt.Const.World.ERemarkable <-
{
	Start_Low = 0,
		BanditLeader = 0,

		HedgeKnight = 1,
		OathBringer = 2,
		Swordmaster = 3,
		MasterArcher = 4,

		NomadLeader = 5,
		DesertDevil = 6,
		DesertStalker = 7,
		Executioner = 8,

		Officer = 9,
		Assassin = 10,
		Gladiator = 11,

		BarbarianChosen = 12,

		GoblinShaman = 13,
		GoblinOverseer = 14,

		OrcBerserker = 15,
		OrcLeader = 16,

		ZombieKnight = 17,
		Necromancer = 18,
		SkeletonPriest = 19,
		Vampire = 20,
		Geist = 21,

		Nightmare = 22,
		Unhold = 23,
		Hexe = 24,
	End_Low = 24,

	Start_Boss = 25,
		BanditBoss = 25,

		HedgeKnightBoss = 26,
		OathBringerBoss = 27,
		SwordmasterBoss = 28,
		MasterArcherBoss = 29,
		
		NomadBoss = 30,
		DesertDevilBoss = 31,
		DesertStalkerBoss = 32,
		ExecutionerBoss = 33,
		OfficerBoss = 34,
		AssassinBoss = 35,
		GladiatorBoss = 36,
		
		BarbarianBoss = 37,

		GoblinBoss = 38,
		OrcBoss = 39,

		ZombieBoss = 40,
		SkeletonBoss = 41,
		NecromancerBoss = 42,
		
		Lv3Ghoul = 43,
		Lv3Sandgolem = 44,
		Lindwurm = 45,
		Schrat = 46,
	End_Boss = 46,

	Start_Unique = 47,
		BarbarianMadman = 47,
		SkeleonKing = 48,
		Ijirok = 49,
		Kraken = 50,
	End_Unique = 50,

	Num = 51,
	
	Resources = 
	[
		"bandit_leader.png",

		"knight.png",
		"oath_bringer.png",
		"sword_master.png",
		"master_archer.png",

		"nomad_leader.png",
		"desert_devil.png",
		"desert_stalker.png",
		"executioner.png",
		
		"officer.png",
		"assassin.png",
		"gladiator.png",

		"barb_chosen.png",

		"goblin_shaman.png",
		"goblin_overseer.png",

		"orc_berserker.png",
		"orc_leader.png",

		"zombie_knight.png",
		"necromancer.png",
		"skeleton_priest.png",
		"vampire.png",
		"geist.png",

		"nightmare.png",
		"unhold.png",
		"hexe.png",

		"bandit_boss.png",

		"knight_boss.png",
		"oath_bringer_boss.png",
		"sword_master_boss.png",
		"master_archer_boss.png",

		"nomad_boss.png",
		"desert_devil_boss.png",
		"desert_stalker_boss.png",
		"executioner_boss.png",
		"officer_boss.png",
		"assassin_boss.png",
		"gladiator_boss.png",

		"barb_boss.png",

		"goblin_boss.png",
		"orc_boss.png",

		"zombie_boss.png",
		"skeleton_boss.png",
		"necromancer_boss.png",
		
		"lv3_ghoul.png",
		"lv3_sand_golem.png",
		"lindwurm.png",
		"schrat.png",

		"barb_madman.png",
		"skeleton_king.png",
		"ijirok.png",
		"kraken.png"
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
				else
				{
					return this.BanditLeader;
				}
				break;

			case this.Const.EntityType.Knight:
			case this.Const.EntityType.HedgeKnight:
				if(_entity.m.IsMiniboss)
				{
					return this.HedgeKnightBoss;
				}
				else
				{
					return this.HedgeKnight;
				}
				break;

				
			case this.Const.EntityType.Oathbringer:
				if(_entity.m.IsMiniboss)
				{
					return this.OathBringerBoss;
				}
				else
				{
					return this.OathBringer;
				}
				break;

			case this.Const.EntityType.Swordmaster:
				if(_entity.m.IsMiniboss)
				{
					return this.SwordmasterBoss;
				}
				else
				{
					return this.Swordmaster;
				}
				break;

			case this.Const.EntityType.MasterArcher:
				if(_entity.m.IsMiniboss)
				{
					return this.MasterArcherBoss;
				}
				else
				{
					return this.MasterArcher;
				}
				break;

			case this.Const.EntityType.NomadLeader:
				if(_entity.m.IsMiniboss)
				{
					return this.NomadBoss;
				}
				else
				{
					return this.NomadLeader;
				}
				break;
				
			case this.Const.EntityType.DesertDevil:
				if(_entity.m.IsMiniboss)
				{
					return this.DesertDevilBoss;
				}
				else
				{
					return this.DesertDevil;
				}
				break;

			case this.Const.EntityType.DesertStalker:
				if(_entity.m.IsMiniboss)
				{
					return this.DesertStalkerBoss;
				}
				else
				{
					return this.DesertStalker;
				}
				break;

			case this.Const.EntityType.Executioner:
				if(_entity.m.IsMiniboss)
				{
					return this.ExecutionerBoss;
				}
				else
				{
					return this.Executioner;
				}
				break;
			
			case this.Const.EntityType.Officer:
				if(_entity.m.IsMiniboss)
				{
					return this.OfficerBoss;
				}
				else
				{
					return this.Officer;
				}
				break;

			case this.Const.EntityType.Assassin:
				if(_entity.m.IsMiniboss)
				{
					return this.AssassinBoss;
				}
				else
				{
					return this.Assassin;
				}
				break;

			case this.Const.EntityType.Gladiator:
				if(_entity.m.IsMiniboss)
				{
					return this.GladiatorBoss;
				}
				else
				{
					return this.Gladiator;
				}
				break;

			case this.Const.EntityType.BarbarianChampion:
				if(_entity.m.IsMiniboss)
				{
					return this.BarbarianBoss;
				}
				else
				{
					return this.BarbarianChosen;
				}
				break;
			case this.Const.EntityType.BarbarianChosen:
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

			case this.Const.EntityType.OrcBerserker:
				return this.OrcBerserker;
				
			case this.Const.EntityType.OrcWarrior:
			case this.Const.EntityType.OrcWarlord:
				if(_entity.m.IsMiniboss)
				{
					return this.OrcBoss;
				}
				else
				{
					return this.OrcLeader;
				}
				break;
				
			case this.Const.EntityType.ZombieKnight:
				if(_entity.m.IsMiniboss)
				{
					return this.ZombieBoss;
				}
				else
				{
					return this.ZombieKnight;
				}
				break;

			case this.Const.EntityType.ZombieBoss:
				return this.ZombieBoss;

			case this.Const.EntityType.SkeletonHeavy:
				if(_entity.m.IsMiniboss)
				{
					return this.SkeletonBoss;
				}
				break;
			case this.Const.EntityType.SkeletonPriest:
				if(_entity.m.IsMiniboss)
				{
					return this.SkeletonBoss;
				}
				else
				{
					return this.SkeletonPriest;
				}
				break;
			
			case this.Const.EntityType.SkeletonLich:
				return this.SkeletonBoss;	

			case this.Const.EntityType.Necromancer:
				if(_entity.m.IsMiniboss)
				{
					return this.NecromancerBoss;
				}
				else
				{
					return this.Necromancer;
				}

			case this.Const.EntityType.Vampire:
				return this.Vampire;

			case this.Const.EntityType.Ghost:
				return this.Geist;

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
			
			
			case this.Const.EntityType.Hexe:
				return this.Hexe;

			case this.Const.EntityType.TricksterGod:
				return this.Ijirok;

			case this.Const.EntityType.Kraken:
				return this.Kraken;

			case this.Const.EntityType.SkeletonBoss:
				return this.SkeletonKing;
			
			case this.Const.EntityType.BarbarianMadman:
				return this.BarbarianMadman;
		}
		return this.Num;
	}
};


::mods_queue("mod_killing_details", null, function() 
{
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
					SpeciesDetails = [],
					Remarkables = [],
				},
				WeaponStats = 
				{
					CurrentUsedWeaponIndex = -1,
					MostUsedWeaponIndex = -1,
					UsedWeaponRecords = [],
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

		::mods_addMember(player, "player", "getKillingSpeciesDetails", function ()
			{
				return this.m.DetailStats.KillingStats.SpeciesDetails;
			}
		);

		::mods_addMember(player, "player", "getKillingRemarkables", function ()
			{
				return this.m.DetailStats.KillingStats.Remarkables;
			}
		);
		
		::mods_addMember(player, "player", "getWeaponStats", function ()
			{
				return this.m.DetailStats.WeaponStats;
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
			local killing_species_details = this.getKillingSpeciesDetails();
			local killing_remarkables = this.getKillingRemarkables();

			killing_species.resize(this.Const.World.ESpecies.Num);
			killing_species_details.resize(this.Const.World.ESpeciesDetails.Num);
			killing_remarkables.resize(this.Const.World.ERemarkable.Num);

			for(local index = 0; index < this.Const.World.ESpecies.Num; index++)
			{
				killing_species[index] = 0;
			}

			for(local index = 0; index < this.Const.World.ESpeciesDetails.Num; index++)
			{
				killing_species_details[index] = 0;
			}

			for(local index = 0; index < this.Const.World.ERemarkable.Num; index++)
			{
				killing_remarkables[index] = 0;
			}
			this.m.Skills.add(this.new("scripts/skills/special/killing_stats"));
		});


		local onSerialize = ::mods_getMember(player, "onSerialize");
		::mods_override(player, "onSerialize", function( _out )
		{
			onSerialize(_out);

			_out.writeU32(detail_mod_version);
			_out.writeU32(this.m.DetailStats.SavedGolds);
			local killing_species = this.getKillingSpecies();
			for(local index = 0; index < this.Const.World.ESpecies.Num; index++)
			{
				_out.writeU32(killing_species[index]);
			}
			
			local killing_species_details = this.getKillingSpeciesDetails();
			for(local index = 0; index < this.Const.World.ESpeciesDetails.Num; index++)
			{
				_out.writeU32(killing_species_details[index]);
			}

			local killing_remarkables = this.getKillingRemarkables();
			for(local index = this.Const.World.ERemarkable.Start_Low; index <= this.Const.World.ERemarkable.End_Low; index++)
			{
				_out.writeU32(killing_remarkables[index]);
			}

			for(local index = this.Const.World.ERemarkable.Start_Boss; index <= this.Const.World.ERemarkable.End_Boss; index++)
			{
				_out.writeU16(killing_remarkables[index]);
			}

			for(local index = this.Const.World.ERemarkable.Start_Unique; index <= this.Const.World.ERemarkable.End_Unique; index++)
			{
				_out.writeU8(killing_remarkables[index]);
			}

			local weapon_stats = this.getWeaponStats();
			local records = weapon_stats.UsedWeaponRecords;	
			records.sort(@(a,b) b.Count<=> a.Count);

			local record_length = records.len();
			
			local k_max_record = 8 + 1;
			if(record_length > k_max_record)
			{
				record_length = k_max_record;
			}

			local last_record_count = 0;
			if(record_length > 1 && records[0].Count > 1)
			{
				record_length -=1;
				local last_record_count = records[record_length].Count;
				for(local index = 0; index < record_length; index+=1)
				{
					local record = records[index];
					record.Count -= last_record_count;
					if(record.Count == 0)
					{
						record_length = index;
						break;
					}
				}
			}

			_out.writeU32(record_length);
			for(local index = 0; index < record_length; index+=1)
			{
				local record = records[index];
				_out.writeString(record.Name);
				_out.writeU32(record.Count);
			}
		});

	
		local onDeserialize = ::mods_getMember(player, "onDeserialize");
		::mods_override(player, "onDeserialize", function( _in )
		{
			onDeserialize(_in);

			local saved_detail_mod_version = _in.readU32();
			if(saved_detail_mod_version >= 1)
			{
				this.m.DetailStats.SavedGolds = _in.readU32();				
				local killing_species = this.getKillingSpecies();
				local killing_species_details = this.getKillingSpeciesDetails();
				local killing_remarkables = this.getKillingRemarkables();
				killing_species.resize(this.Const.World.ESpecies.Num)
				killing_species_details.resize(this.Const.World.ESpeciesDetails.Num)
				killing_remarkables.resize(this.Const.World.ERemarkable.Num)

				for(local index = 0; index < this.Const.World.ESpecies.Num; index++)
				{
					killing_species[index] = _in.readU32();
				}
				for(local index = 0; index < this.Const.World.ESpeciesDetails.Num; index++)
				{
					killing_species_details[index] = _in.readU32();
				}

				for(local index = this.Const.World.ERemarkable.Start_Low; index <= this.Const.World.ERemarkable.End_Low; index++)
				{
					killing_remarkables[index] = _in.readU32();
				}

				for(local index = this.Const.World.ERemarkable.Start_Boss; index <= this.Const.World.ERemarkable.End_Boss; index++)
				{
					killing_remarkables[index] = _in.readU16();
				}

				for(local index = this.Const.World.ERemarkable.Start_Unique; index <= this.Const.World.ERemarkable.End_Unique; index++)
				{
					killing_remarkables[index] = _in.readU8();
				}
			}

			if(saved_detail_mod_version == 2)
			{
				local weapon_stats = this.getWeaponStats();
				local records = weapon_stats.UsedWeaponRecords;
				local length = _in.readU32();
				local most_used_index = -1;
				local most_used_count = -1;
				for(local index = 0; index < length; index+=1)
				{
					local Name = _in.readString();
					local Count = _in.readU32();
					
					records.push( {Name = Name, Count = Count});
					if(most_used_count < Count)
					{
						most_used_count = Count;
						most_used_index = index;
					}
				}
				weapon_stats.CurrentUsedWeaponIndex = weapon_stats.MostUsedWeaponIndex = most_used_index;

				foreach(record in records)
				{
					this.logInfo("name=" + record.Name + ", count=" + record.Count);
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
						local index_end = this.Const.World.ESpecies.Num - 1;
						while(index_start < this.Const.World.ESpecies.Num && killing_species[index_start] == 0)
						{
							index_start++;
						}
						while(index_end > index_start && killing_species[index_end] == 0)
						{
							index_end--;
						}
						if(index_start < this.Const.World.ESpecies.Num)
						{
							detail_text = ", including " 
										+ killing_species[index_start] 
										+ " " 
										+ this.Const.World.ESpecies.Names[(killing_species[index_start] == 1 ? index_start*2 : index_start*2+1)];
							
							if(index_start != index_end)
							{
								for(index_start++; index_start < index_end; index_start++)
								{
									if(killing_species[index_start] > 0)
									{
										detail_text += ", "
													+ killing_species[index_start] + " " 
													+ this.Const.World.ESpecies.Names[(killing_species[index_start] == 1 ? index_start*2 : index_start*2+1)];
														
									}
								}

								detail_text += " and "
											+ killing_species[index_start] + " " 
											+ this.Const.World.ESpecies.Names[(killing_species[index_start] == 1 ? index_start*2 : index_start*2+1)]
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

			local saved = this.getSavedGolds();
			if(saved > 0)
			{
				local saved_golds_desc = "Saved [img]gfx/ui/tooltips/money.png[/img] " + saved + " golds .";
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

			local weapon_stats = this.getWeaponStats();
			if(weapon_stats.MostUsedWeaponIndex != -1)
			{
				local weapon_name = weapon_stats.UsedWeaponRecords[weapon_stats.MostUsedWeaponIndex].Name;
				local saved_golds_desc_item = { id = 40, type = "description", text = "His favorite weapon is " +  weapon_name + "."};
				tooltips.push(saved_golds_desc_item);
			}
			return tooltips;
		};
		
		::mods_override(player, "getRosterTooltip", getRosterTooltip_);
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
						bro.m.DetailStats.SavedGolds += bro.getDailyCost();
					}
				}
			}
			update( _worldState );
		}
		::mods_override(assetManager, "update", update_);
	});
});