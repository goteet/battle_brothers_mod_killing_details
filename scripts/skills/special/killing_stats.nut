::KillingStats <- {
    ESpecies = {
        Humen = 0,
        Greenskins = 1,
        Undeads = 2,
        Beasts = 3,
        Witches = 4,
        Num = 5,

        function fromEntityType( _type ) {
            switch(_type) {
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
    },
    ESpeciesDetails = {
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

        Resources = [
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

        function fromEntityType( _type ) {
            switch(_type)
            {
                case this.Const.EntityType.Cultist:
                case this.Const.EntityType.BanditThug:
                case this.Const.EntityType.BanditPoacher:
                case this.Const.EntityType.BanditMarksman:
                case this.Const.EntityType.BanditRaider:
                case this.Const.EntityType.BanditLeader:
                    return this.Bandits;

                case this.Const.EntityType.Peasant:
                case this.Const.EntityType.CaravanHand:
                case this.Const.EntityType.CaravanGuard:
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

                //case this.Const.EntityType.Slave:
                case this.Const.EntityType.Conscript:
                case this.Const.EntityType.Gunner:
                case this.Const.EntityType.Officer:
                case this.Const.EntityType.Engineer:
                case this.Const.EntityType.Assassin:
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
    },
    ERemarkable = {
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
            SkeletonKing = 48,
            Ijirok = 49,
            Kraken = 50,
        End_Unique = 50,
        Num = 51,
        
        Resources =  [
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

        function fromEntity( _entity ) {
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
    },
    TitleName       = "Killing Details",
    TooltipText = {
        Including   = "including ",
        And         = " and "
        Period      = ".",
        Comma       = ", ",

        SpeciesNames = [
            " Human",        " Humen",
            " Greenskin",    " Greenskins",
            " Undead",       " Undead things",
            " Beast",        " Beasts",
            " Witch",        " Witches"
        ],

        TitleSpecies        = "The opponents he slained in each type:",
        TitleRemarkableLow  = "The strong opponents he killed:",
        TitleRemarkableBoss = "The Remarkable opponents he vanquished:",
        TitleUniqueBoss     = "The Legenary opponents he conquered:",

        
        NoBattleDay1        = "He is too fresh to meet his destiny.",
        NoBattleDayN        = "He joined the company %d days, but has no kills yet.",
        BattlePrefix1       = "He participate %d battle",
        BattlePrefixN       = "He participate %d battles",
        BattleDayN          = " in %d days",
        BattleDay1          = " at the first day he join the company",
        BattleDay0          = " without hesitate when he just join in the company",
        BattleKill0         = " and has %d kill",
        BattleKillN         = " and has %d kills",
        BattleKillNWithNoRecords    = ", but we couldn't remember what things he killed.",
        BattleKill0WithNoRecords    = ", but has no kills yet.",
    }
}

this.killing_stats <- this.inherit("scripts/skills/skill", {
    m = {
        SavedGolds = 0,
        KillingStats = {
            Species = [],
            SpeciesDetails = [],
            Remarkables = [],
        },
        WeaponStats = {
            CurrentUsedWeaponIndex = -1,
            MostUsedWeaponIndex = -1,
            UsedWeaponRecords = [],
        }
    },
    function create()
    {
        this.m.ID			= "special.killing_stats";
        this.m.Name 		= ::KillingStats.TitleName;
        this.m.Description	= "The Killing Detail Counter";
        this.m.Icon			= "skills/killing_stats.png";
        this.m.IconMini		= "";
        this.m.Order 		= this.Const.SkillOrder.Trait + 601;
        this.m.Type 		= this.Const.SkillType.Special | this.Const.SkillType.Trait;
        this.m.IsActive 	= false;
        this.m.IsHidden 	= false;

        if(this.m.KillingStats.Species.len() == 0)
        {
            this.m.KillingStats.Species.resize(::KillingStats.ESpecies.Num);
            for(local index = 0; index < ::KillingStats.ESpecies.Num; index++)
            {
                this.m.KillingStats.Species[index] = 0;
            }
        }
        
        if(this.m.KillingStats.SpeciesDetails.len() == 0)
        {
            this.m.KillingStats.SpeciesDetails.resize(::KillingStats.ESpeciesDetails.Num);
            for(local index = 0; index < ::KillingStats.ESpeciesDetails.Num; index++)
            {
                this.m.KillingStats.SpeciesDetails[index] = 0;
            }
        }

        if(this.m.KillingStats.Remarkables.len() == 0)
        {
            this.m.KillingStats.Remarkables.resize(::KillingStats.ERemarkable.Num);
            for(local index = 0; index < ::KillingStats.ERemarkable.Num; index++)
            {
                this.m.KillingStats.Remarkables[index] = 0;
            }
        }
    }

    function getKillingDetalsText()
    {
        local indexStart = 0;
        local indexEnd = ::KillingStats.ESpecies.Num - 1;

        //find first species;
        while(indexStart < ::KillingStats.ESpecies.Num && this.m.KillingStats.Species[indexStart] == 0)
        {
            indexStart++;
        }

        //find last species;
        while(indexEnd > indexStart && this.m.KillingStats.Species[indexEnd] == 0)
        {
            indexEnd--;
        }

        if(indexStart < ::KillingStats.ESpecies.Num)
        {
            local description = format(::KillingStats.TooltipText.Comma + ::KillingStats.TooltipText.Including + "%d%s"
                    , this.m.KillingStats.Species[indexStart]
                    , ::KillingStats.TooltipText.SpeciesNames[(this.m.KillingStats.Species[indexStart] == 1 ? indexStart*2 : indexStart*2+1)]
            );
            
            if(indexStart != indexEnd)
            {
                for(indexStart++; indexStart < indexEnd; indexStart++)
                {
                    if(this.m.KillingStats.Species[indexStart] > 0)
                    {
                        description += format(::KillingStats.TooltipText.Comma + "%d%s"
                            , this.m.KillingStats.Species[indexStart]
                            , ::KillingStats.TooltipText.SpeciesNames[(this.m.KillingStats.Species[indexStart] == 1 ? indexStart*2 : indexStart*2+1)]
                        );        
                    }
                }

                description += format(::KillingStats.TooltipText.And + "%d%s"
                    , this.m.KillingStats.Species[indexStart]
                    , ::KillingStats.TooltipText.SpeciesNames[(this.m.KillingStats.Species[indexStart] == 1 ? indexStart*2 : indexStart*2+1)]
                );
            }

            description += ::KillingStats.TooltipText.Period;
            return description;
        }
        else
        {
            return ::KillingStats.TooltipText.Period;
        }
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

        local speciesDetailTexts = [];
        local remarkableLowTexts = [];
        local remarkableBossTexts = [];
        local uniqueBosstext = "";        

        for(local index = 0; index < ::KillingStats.ESpeciesDetails.Num; index++)
        {
            if(this.m.KillingStats.SpeciesDetails[index] > 0 )
            {
                local text = format("[img]gfx/ui/tooltips/orientation/%s[/img] %d"
                    , ::KillingStats.ESpeciesDetails.Resources[index]
                    , this.m.KillingStats.SpeciesDetails[index]
                );
                speciesDetailTexts.push(text);
            }
        }
        for(local index = ::KillingStats.ERemarkable.Start_Low; index <= ::KillingStats.ERemarkable.End_Low; index++)
        {
            if(this.m.KillingStats.Remarkables[index] > 0 )
            {
                local text = format("[img]gfx/ui/tooltips/orientation/%s[/img] %d"
                    , ::KillingStats.ERemarkable.Resources[index]
                    , this.m.KillingStats.Remarkables[index]
                );
                remarkableLowTexts.push(text);
            }
        }
        for(local index = ::KillingStats.ERemarkable.Start_Boss; index <= ::KillingStats.ERemarkable.End_Boss; index++)
        {
            if(this.m.KillingStats.Remarkables[index] > 0 )
            {
                local text = format("[img]gfx/ui/tooltips/orientation/%s[/img] %d"
                    , ::KillingStats.ERemarkable.Resources[index]
                    , this.m.KillingStats.Remarkables[index]
                );
                remarkableBossTexts.push(text);
            }
        }
        for(local index = ::KillingStats.ERemarkable.Start_Unique; index <= ::KillingStats.ERemarkable.End_Unique; index++)
        {
            if(this.m.KillingStats.Remarkables[index] > 0 )
            {
                uniqueBosstext += format("[img]gfx/ui/tooltips/orientation/%s[/img] ", ::KillingStats.ERemarkable.Resources[index]);
            }
        }
        

        local actor = this.getContainer().getActor();
        local time = actor.getDaysWithCompany();
        local battles = actor.m.LifetimeStats.Battles;
        local numKills = actor.m.LifetimeStats.Kills;

        local participateText = "";
        if(battles > 0)
        {
             participateText = format((battles > 1 ? ::KillingStats.TooltipText.BattlePrefixN : ::KillingStats.TooltipText.BattlePrefix1), battles);

            if(time > 1)
            {
                participateText += format(::KillingStats.TooltipText.BattleDayN, time);
            }
            else if(time < 1)
            {
                participateText += ::KillingStats.TooltipText.BattleDay0;
            }
            else
            {
                participateText += ::KillingStats.TooltipText.BattleDay1;
            }
            
            if(numKills > 0)
            {
                local bIsSingleKill = numKills == 1;
                participateText += format((bIsSingleKill ? ::KillingStats.TooltipText.BattleKill0 : ::KillingStats.TooltipText.BattleKillN), numKills);
                local bHasKillingRecords = speciesDetailTexts.len() > 0 || remarkableLowTexts.len() > 0 || remarkableBossTexts.len() > 0 || uniqueBosstext != "";
                if(bHasKillingRecords)
                {
                    participateText += this.getKillingDetalsText();
                }
                else
                {
                    participateText += ::KillingStats.TooltipText.BattleKillNWithNoRecords;
                }
            }
            else
            {
                participateText += ::KillingStats.TooltipText.BattleKill0WithNoRecords; 
            }
            ret.push({ id = 2, type = "description", text = participateText });
        }
        else
        {
            if(time > 1)
            {
                participateText = format(::KillingStats.TooltipText.NoBattleDayN, time);
            }
            else
            {
                participateText = ::KillingStats.TooltipText.NoBattleDay1;
            }
            ret.push({ id = 2, type = "description", text = participateText });
            return ret;
        }

        
        local formatIconTextLines = function(list) {
            local kNumColumns = 5;
            local numLines = (list.len() + kNumColumns - 1) / kNumColumns;
            local lines = [];

            local bIsFinale = false; //dont remember what bug it is, so leave what it looks like.
            for(local lindeIndex = 0; lindeIndex < numLines && !bIsFinale; lindeIndex += 1)
            {
                local lineText = "";
                for(local index = 0; index < kNumColumns; index += 1)
                {
                    local textIndex = lindeIndex * kNumColumns + index;
                    lineText += list[textIndex];
                    if(textIndex == list.len() - 1)
                    {
                        lineText += ::KillingStats.TooltipText.Period; 
                        bIsFinale = true;
                        break;
                    }
                    else
                    {
                        lineText += ::KillingStats.TooltipText.Comma; 
                    }
                }
                lines.push(lineText);
            }
            return lines;
        }

        if(speciesDetailTexts.len() > 0)
        {
            ret.push({ id = 20, type = "text", text = ::KillingStats.TooltipText.TitleSpecies });
            local lines = formatIconTextLines(speciesDetailTexts);
            local lineIndex = 1;
            foreach(line in lines)
            {
                ret.push({ id = 20 + lineIndex, type = "text", text = line });
                ++lineIndex;
            }
        }

        if(remarkableLowTexts.len() > 0)
        {
            ret.push({ id = 30, type = "text", text = ::KillingStats.TooltipText.TitleRemarkableLow });
            local lines = formatIconTextLines(remarkableLowTexts);
            local lineIndex = 1;
            foreach(line in lines)
            {
                ret.push({ id = 30 + lineIndex, type = "text", text = line });
                ++lineIndex;
            }
        }

        if(remarkableBossTexts.len() > 0)
        {
            ret.push({ id = 40, type = "text", text = ::KillingStats.TooltipText.TitleRemarkableBoss });
            local lines = formatIconTextLines(remarkableBossTexts);
            local lineIndex = 1;
            foreach(line in lines)
            {
                ret.push({ id = 40 + lineIndex, type = "text", text = line });
                ++lineIndex;
            }
        }

        
        if(uniqueBosstext != "")
        {
            ret.push({ id = 50, type = "text", text = ::KillingStats.TooltipText.TitleUniqueBoss });
            ret.push({ id = 51, type = "text", text = uniqueBosstext});
        }
        return ret;
    }

    function onTargetKilled( _targetEntity, _skill )
    {
        if (_targetEntity.getXPValue() > 0)
        {
            local actor = this.getContainer().getActor();
            local species_type = ::KillingStats.ESpecies.fromEntityType(_targetEntity.getType());
            if(species_type < ::KillingStats.ESpecies.Num)
            {
                this.m.KillingStats.Species[species_type] += 1;
            }

            local species_detail_type = ::KillingStats.ESpeciesDetails.fromEntityType(_targetEntity.getType());
            if(species_detail_type < ::KillingStats.ESpeciesDetails.Num)
            {
                this.m.KillingStats.SpeciesDetails[species_detail_type] += 1;
            }

            local remarkable_type = ::KillingStats.ERemarkable.fromEntity( _targetEntity );
            if(remarkable_type < ::KillingStats.ERemarkable.Num)
            {
                this.m.KillingStats.Remarkables[remarkable_type] += 1;
            }
        }
    }

    function onCalculateFavoriteWeapon(_skill)
    {
        if(_skill.m.IsAttack && _skill.m.IsWeaponSkill && !_skill.m.IsOffensiveToolSkill)
        {
            local actor = this.getContainer().getActor();
            local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
            if(item != null)
            {
                local used_list = this.m.WeaponStats.UsedWeaponRecords;
                local item_name =  item.getName();

                if(this.m.WeaponStats.CurrentUsedWeaponIndex == -1 || used_list[this.m.WeaponStats.CurrentUsedWeaponIndex].Name != item_name)
                {
                    this.m.WeaponStats.CurrentUsedWeaponIndex = -1;
                    foreach(index, record in used_list)
                    {
                        if(record.Name == item_name)
                        {
                            this.m.WeaponStats.CurrentUsedWeaponIndex = index;
                            break;
                        }
                    }
                }

                if(this.m.WeaponStats.CurrentUsedWeaponIndex == -1)
                {
                    local record = { Name = item_name, Count = 1 }; 
                    used_list.push(record);
                    this.m.WeaponStats.CurrentUsedWeaponIndex = used_list.len() - 1;
                }
                else
                {
                    used_list[this.m.WeaponStats.CurrentUsedWeaponIndex].Count += 1;
                }

                if(this.m.WeaponStats.MostUsedWeaponIndex == -1)
                {
                    local most_used_weapon_count = 0;
                    foreach(index, record in this.m.WeaponStats.UsedWeaponRecords)
                    {
                        if(most_used_weapon_count < record.Count)
                        {
                            most_used_weapon_count = record.Count;
                            this.m.WeaponStats.MostUsedWeaponIndex = index;
                        }
                    }
                }
                
                if(this.m.WeaponStats.CurrentUsedWeaponIndex != this.m.WeaponStats.MostUsedWeaponIndex)
                {
                    local most_used = used_list[this.m.WeaponStats.MostUsedWeaponIndex];
                    local curr_used = used_list[this.m.WeaponStats.CurrentUsedWeaponIndex];

                    if(most_used.Count < curr_used.Count)
                    {
                        this.m.WeaponStats.MostUsedWeaponIndex = this.m.WeaponStats.CurrentUsedWeaponIndex;
                    }
                }
            }
        }
    }

    function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
    {
        this.onCalculateFavoriteWeapon(_skill)
    }

    function onTargetMissed( _skill, _targetEntity )
    {
        this.onCalculateFavoriteWeapon(_skill)
    }

    function onSerialize( _out )
    {
        this.skill.onSerialize(_out);
        local CurrentVersion = 1;
        _out.writeU32(CurrentVersion);
        _out.writeU32(this.m.SavedGolds);

        for(local index = 0; index < ::KillingStats.ESpecies.Num; index++)
        {
            _out.writeU32(this.m.KillingStats.Species[index]);
        }
        
        for(local index = 0; index < ::KillingStats.ESpeciesDetails.Num; index++)
        {
            _out.writeU32(this.m.KillingStats.SpeciesDetails[index]);
        }
        
        for(local index = ::KillingStats.ERemarkable.Start_Low; index <= ::KillingStats.ERemarkable.End_Low; index++)
        {
            _out.writeU32(this.m.KillingStats.Remarkables[index]);
        }

        for(local index = ::KillingStats.ERemarkable.Start_Boss; index <= ::KillingStats.ERemarkable.End_Boss; index++)
        {
            _out.writeU16(this.m.KillingStats.Remarkables[index]);
        }

        for(local index = ::KillingStats.ERemarkable.Start_Unique; index <= ::KillingStats.ERemarkable.End_Unique; index++)
        {
            _out.writeU8(this.m.KillingStats.Remarkables[index]);
        }

        this.m.WeaponStats.UsedWeaponRecords.sort(@(a,b) b.Count <=> a.Count);
        local numRecords = this.m.WeaponStats.UsedWeaponRecords.len();
        
        //shrink records.
        local kNumMaxRecords = 8;
        if(numRecords > kNumMaxRecords + 1)
        {
            numRecords = kNumMaxRecords + 1;
        }

        local last_record_count = 0;
        if(numRecords > kNumMaxRecords && this.m.WeaponStats.UsedWeaponRecords[0].Count > 1)
        {
            local lastRecordIndex = numRecords - 1;
            local lastRecordCount = this.m.WeaponStats.UsedWeaponRecords[lastRecordIndex].Count;
            for(local index = 0; index < lastRecordIndex; index+=1)
            {
                local record = this.m.WeaponStats.UsedWeaponRecords[index];
                record.Count -= lastRecordCount;
                if(record.Count == 0)
                {
                    numRecords = index;
                    break;
                }
            }
        }

        local recordOffset = 0;
        if(numRecords > 0 && this.m.WeaponStats.UsedWeaponRecords[numRecords - 1].Count > 100)
        {
            recordOffset = 50;
        }

        _out.writeU32(numRecords);
        for(local index = 0; index < numRecords; index+=1)
        {
            local record = this.m.WeaponStats.UsedWeaponRecords[index];
            _out.writeString(record.Name);
            _out.writeU32(record.Count - recordOffset);
        }
    }

    function onDeserialize( _in )
    {
        this.skill.onDeserialize(_in);
        local SaveVersion = _in.readU32();
        this.m.SavedGolds = _in.readU32();
        this.m.KillingStats.Species.resize(::KillingStats.ESpecies.Num)
        this.m.KillingStats.SpeciesDetails.resize(::KillingStats.ESpeciesDetails.Num)
        this.m.KillingStats.Remarkables.resize(::KillingStats.ERemarkable.Num)

        for(local index = 0; index < ::KillingStats.ESpecies.Num; index++)
        {
            this.m.KillingStats.Species[index] = _in.readU32();
        }

        for(local index = 0; index < ::KillingStats.ESpeciesDetails.Num; index++)
        {
            this.m.KillingStats.SpeciesDetails[index] = _in.readU32();
        }

        for(local index = ::KillingStats.ERemarkable.Start_Low; index <= ::KillingStats.ERemarkable.End_Low; index++)
        {
            this.m.KillingStats.Remarkables[index] = _in.readU32();
        }

        for(local index = ::KillingStats.ERemarkable.Start_Boss; index <= ::KillingStats.ERemarkable.End_Boss; index++)
        {
            this.m.KillingStats.Remarkables[index] = _in.readU16();
        }

        for(local index = ::KillingStats.ERemarkable.Start_Unique; index <= ::KillingStats.ERemarkable.End_Unique; index++)
        {
            this.m.KillingStats.Remarkables[index] = _in.readU8();
        }

        local length = _in.readU32();
        local mostUsedIndex = -1;
        local mostUsedCount = -1;
        for(local index = 0; index < length; index++)
        {
            local Name	= _in.readString();
            local Count	= _in.readU32();
                
            this.m.WeaponStats.UsedWeaponRecords.push( {Name = Name, Count = Count} );
            if(mostUsedCount < Count)
            {
                mostUsedIndex = index;
                mostUsedCount = Count;
            }
        }
        this.m.WeaponStats.CurrentUsedWeaponIndex = this.m.WeaponStats.MostUsedWeaponIndex = mostUsedIndex;
    }
});

