/*
  Breaking Point Mod for Arma 3

  Released under Arma Public Share Like Licence (APL-SA)
  https://www.bistudio.com/community/licenses/arma-public-license-share-alike

  Alderon Games Pty Ltd
*/

	class Scavenger : BP_BaseFaction
	{
	    name = "Scavenger";
		
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
					uniform[] = {};
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
			
			class Level_0 : Level_Base 
			{
				class Spawn
				{
					//Array Of Toolbelt Items
					toolbelt[] = {};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Scavenger_F"};
					backpack[] = {};
					vest[] = {};
					uniform[] = {"BP_Scavenger_F"};
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
				class Spawn
				{
					//Array Of Toolbelt Items
					toolbelt[] = {"G_MM_Hockey_Mask"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {"MeleeShovel"};
					handgun[] = {};
					clothing[] = {"BP_Scavenger_1"};
					backpack[] = {"BP_AssaultPack_Worn"};
					vest[] = {};
					uniform[] = {"BP_Scavenger_1"};
					headgear[]={""};
					nvg[]={""};
					facewear[]={"G_MM_Hockey_Mask"};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemBandage","ItemBandage","ItemPainkiller"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
			class Level_2 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"TRYK_ESS_BLKTAN_NV","G_MM_FaceFork"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {"MeleeShovel"};
					handgun[] = {};
					clothing[] = {"BP_Scavenger_2"};
					backpack[] = {"BP_AssaultPack_Worn"};
					vest[] = {"V_BanditBandolier_BP"};
					uniform[] = {"BP_Scavenger_2"};
					headgear[]={""};
					nvg[]={"TRYK_ESS_BLKTAN_NV"};
					facewear[]={"G_MM_FaceFork"};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemBandage","ItemBandage","ItemPainkiller"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear  {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Backpack : BP_BaseGear  {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
			class Level_3 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {"MeleeShovel"};
					handgun[] = {};
					clothing[] = {"BP_Scavenger_3"};
					backpack[] = {"BP_Carryall_Bandit"};
					vest[] = {"V_BanditBandolier_BP"};
					uniform[] = {"BP_Scavenger_3"};
					headgear[]={""};
					nvg[]={"","TRYK_ESS_BLKTAN_NV"};
					facewear[]={"","G_MM_Crow_Dazzle_Mask","G_MM_Hockey_Mask","G_MM_FaceFork","G_MM_Catchers_Mask","SP_Balaclava_Venom","NeckTight_RED","NeckTight_TanO"};
				};
				class Uniform : BP_BaseGear  {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemBandage","ItemBandage"};
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
				class Backpack : BP_BaseGear 
				{
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ItemDuctTape"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
			class Level_4 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"G_MM_Crow_Dazzle_Mask","ItemToolbox"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {"MeleeShovel"};
					handgun[] = {};
					clothing[] = {"BP_Scavenger_4"};
					backpack[] = {"BP_Coyote_Bandit"};
					vest[] = {"V_BanditBandolier_BP"};
					uniform[] = {"BP_Scavenger_4","BP_scavenger_4_Hawk"};
					headgear[]={""};
					nvg[]={"","TRYK_ESS_BLKTAN_NV"};
					facewear[]={"G_MM_Crow_Dazzle_Mask","","G_MM_Hockey_Mask","G_MM_FaceFork","G_MM_Catchers_Mask","SP_Balaclava_Venom","NeckTight_RED","NeckTight_TanO"};
				};
				class Uniform : BP_BaseGear  {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemBandage","ItemBandage"};
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
				class Backpack : BP_BaseGear 
				{
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ItemDuctTape"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
			};
		};
		
		class Points
		{
			base = 0;
			min = -3000;
			max = 11000;
			//Dont Include Level 0 ( Evil ) It's auto detected if < base value.
			levels[] = {0,2000,5000,10000};
			class Aid {
				class Scavenger {
					food = 5;
					drink = 5;
					bandage = 10;
					dressing = 15;
					morphine = 15;
					surgery = 25;
					gut = -50;
				};
				class Ranger {
					food = -10;
					drink = -10;
					bandage = -10;
					dressing = -25;
					morphine = -25;
					surgery = -100;
					gut = 0;
				};
				class Nomad {
					food = -10;
					drink = -10;
					bandage = -10;
					dressing = -25;
					morphine = -25;
					surgery = -100;
					gut = 0;
				};
				class Survivalist {
					food = -5;
					drink = -5;
					bandage = -5;
					dressing = -10;
					morphine = -10;
					surgery = -50;
					gut = 0;
				};
				class Outlaw {
					food = 5;
					drink = 5;
					bandage = 10;
					dressing = 10;
					morphine = 10;
					surgery = 20;
					gut = 0;
				};
				class Hunter {
					food = -5;
					drink = -5;
					bandage = -5;
					dressing = -10;
					morphine = -25;
					surgery = -50;
					gut = 50;
				};
				class Engineer {
					food = 0;
					drink = 0;
					bandage = 0;
					dressing = 0;
					morphine = 0;
					surgery = 0;
					gut = 0;
				};
			};
			class Destroy {
				vehicle = 50;
				class Scavenger {
					storage = 0;
				};
				class Ranger {
					storage = 150;
				};
				class Nomad {
					storage = 150;
				};
				class Survivalist {
					storage = 250;
				};
				class Outlaw {
					storage = 0;
				};
				class Hunter {
					storage = 150;
				};
				class Engineer {
					storage = 150;
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
					BP_Dog_Scavenger = 0;
					BP_Dog_Ranger = 0;
					BP_Dog_Nomad = 0;
					BP_Dog_Hunter = 0;
					BP_Dog_Outlaw = 0;
					BP_Dog_Survivalist = 0;
					BP_Dog_Engineer = 0;
				};
				
				class Gut
				{
					BP_Chicken = 0;
					BP_Sheep = 0;
					BP_Dog = 0;
					BP_Dog_Scavenger = 0;
					BP_Dog_Ranger = 0;
					BP_Dog_Nomad = 0;
					BP_Dog_Hunter = 0;
					BP_Dog_Outlaw = 0;
					BP_Dog_Engineer = 0;
				};
			};
			class Kill {
				class Scavenger {
					Level_0 = 50;
					Level_1 = -500;
					Level_2 = -800;
					Level_3 = -1500;
					Level_4 = -1750;
				};
				class Ranger {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 25;
					Level_4 = 50;
				};
				class Outlaw {
					Level_0 = 50;
					Level_1 = -400;
					Level_2 = -700;
					Level_3 = -1200;
					Level_4 = -1500;
				};
				class Hunter {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 25;
					Level_4 = 50;
				};
				class Nomad {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 25;
					Level_4 = 50;
				};
				class Survivalist {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 25;
					Level_4 = 50;
				};
				class Engineer {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 0;
					Level_4 = 0;
				};
			};
		};
	};