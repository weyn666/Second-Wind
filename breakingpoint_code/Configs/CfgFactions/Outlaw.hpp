/*
  Breaking Point Mod for Arma 3

  Released under Arma Public Share Like Licence (APL-SA)
  https://www.bistudio.com/community/licenses/arma-public-license-share-alike

  Alderon Games Pty Ltd
*/
	class Outlaw : BP_BaseFaction 
	{
		name = "Outlaw";
		icon = "\breakingpoint_ui\icons\OutlawIcon.paa";
		
		class Levels : Levels {
			class Level_Base : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {};
					backpack[] = {};
					vest[] = {};
					headgear[]={""};
					nvg[]={""};
					facewear[]={""};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear {};
			};
			
			class Level_0 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Rebel_F"};
					backpack[] = {};
					vest[] = {};
					uniform[] = {"BP_Rebel_F"};
					headgear[]={""};
					nvg[]={""};
					facewear[]={""};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear {};
			};
			
			class Level_1 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"ItemMap"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Rebel_1"};
					backpack[] = {};
					vest[] = {};
					uniform[] = {"BP_Rebel_1"};
					headgear[]={""};
					nvg[]={"Outlaw_BandanaRED"};
					facewear[]={""};
				};
				class Uniform : BP_BaseGear  {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemPainkiller","ItemBandage","ItemBandage"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ChemR","ChemR","ItemMatchbox"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
			class Level_2 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"ItemMap"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Rebel_2"};
					backpack[] = {"BP_Rpack"};
					vest[] = {};
					uniform[] = {"BP_Rebel_2"};
					headgear[]={""};
					nvg[]={""};
					facewear[]={""};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemPainkiller","ItemBandage","ItemBandage"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear 
				{
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ChemR","ChemR","ItemMatchbox"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
			class Level_3 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"ItemMap"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Rebel_3"};
					backpack[] = {"BP_Rpack2"};
					vest[]={"BP_ExplosiveVest"};
					uniform[] = {"BP_Rebel_3"};
					headgear[]={""};
					nvg[]={""};
					facewear[]={""};
				};
				class Uniform : BP_BaseGear  {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemPainkiller","ItemBandage","ItemBandage","BlueprintIED1"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ChemR","ChemR","HandGrenade","ItemMatchbox"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
			class Level_4 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"ItemMap","Outlaw_BandanaTAN","BP_Outlaw_LungeeOpenDes"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Rebel_4"};
					backpack[] = {"BP_RadioPack"};
					vest[]={"BP_ExplosiveVest"};
					uniform[] = {"BP_Rebel_4","BP_Rebel_4_ChocChip"};
					headgear[] = {"BP_Outlaw_LungeeOpenDes"};
					nvg[]={"Outlaw_BandanaTAN","Outlaw_BandanaRED"};
					facewear[]={""};
				};
				class Uniform : BP_BaseGear  {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemPainkiller","ItemBandage","ItemBandage","BlueprintIED1"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Backpack : BP_BaseGear {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ChemR","ChemR","HandGrenade","ItemMatchbox"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
		};
		
		class Points {
			base = 0;
			min = -3000;
			max = 12000;
			//Dont Include Level 0 ( Evil ) It's auto detected if < base value.
			levels[]={0,2000,5000,10000};
			class Aid
			{
				class scavenger {
					food = 10;
					drink = 10;
					bandage = 5;
					dressing = 10;
					morphine = 15;
					surgery = 15;
					gut = -3500;
				};
				class Ranger {
					food = -50;
					drink = -50;
					bandage = -50;
					dressing = -100;
					morphine = -100;
					surgery = -200;
					gut = 50;
				};
				class Nomad {
					food = -50;
					drink = -50;
					bandage = -50;
					dressing = -100;
					morphine = -100;
					surgery = -200;
					gut = 0;
				};
				class Survivalist {
					food = -50;
					drink = -50;
					bandage = -50;
					dressing = -100;
					morphine = -100;
					surgery = -200;
					gut = 0;
				};
				class Outlaw {
					food = 10;
					drink = 10;
					bandage = 5;
					dressing = 10;
					morphine = 15;
					surgery = 15;
					gut = -3500;
				};
				class Hunter {
					food = -50;
					drink = -50;
					bandage = -50;
					dressing = -100;
					morphine = -100;
					surgery = -200;
					gut = 50;
				};
			};
			class Destroy {
				vehicle = 10;
				class scavenger {
					storage = 0;
				};
				class Ranger {
					storage = 50;
				};
				class Nomad {
					storage = 50;
				};
				class Survivalist {
					storage = 200;
				};
				class Outlaw {
					storage = 0;
				};
				class Hunter {
					storage = 50;
				};
				class None {
					storage = 40;
				};
			};
			class Hunt
			{
				//Animal Classname = Points Gained / Lost
				class Kill
				{
					BP_Chicken = 0;
					BP_Sheep = 0;
					BP_Dog = 0;
					BP_Dog_scavenger = 0;
					BP_Dog_Ranger = 0;
					BP_Dog_Nomad = 0;
					BP_Dog_Hunter = 0;
					BP_Dog_Outlaw = 0;
					BP_Dog_Survivalist = 0;
				};
				
				class Gut
				{
					BP_Chicken = 0;
					BP_Sheep = 0;
					BP_Dog = 0;
					BP_Dog_scavenger = 0;
					BP_Dog_Ranger = 0;
					BP_Dog_Nomad = 0;
					BP_Dog_Hunter = 0;
					BP_Dog_Outlaw = 0;
					BP_Dog_Survivalist = 0;
				};
			};
			class Kill {
				class scavenger {
					Level_0 = 75;
					Level_1 = -250;
					Level_2 = -500;
					Level_3 = -1200;
					Level_4 = -1700;
					Dog = -25;
				};
				class Ranger {
					Level_0 = 25;
					Level_1 = 50;
					Level_2 = 100;
					Level_3 = 150;
					Level_4 = 200;
					Dog = 15;
				};
				class Outlaw {
					Level_0 = 75;
					Level_1 = -300;
					Level_2 = -600;
					Level_3 = -1500;
					Level_4 = -2000;
					Dog = -25;
				};
				class Hunter {
					Level_0 = 50;
					Level_1 = 50;
					Level_2 = 75;
					Level_3 = 100;
					Level_4 = 150;
					Dog = 10;
				};
				class Nomad {
					Level_0 = 25;
					Level_1 = 50;
					Level_2 = 75;
					Level_3 = 125;
					Level_4 = 150;
					Dog = 10;
				};
				class Survivalist {
					Level_0 = 25;
					Level_1 = 50;
					Level_2 = 75;
					Level_3 = 125;
					Level_4 = 150;
					Dog = 10;
				};
			};
		};
	};