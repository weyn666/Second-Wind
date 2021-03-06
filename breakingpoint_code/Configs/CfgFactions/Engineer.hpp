/*
  Breaking Point Mod for Arma 3

  Released under Arma Public Share Like Licence (APL-SA)
  https://www.bistudio.com/community/licenses/arma-public-license-share-alike

  Alderon Games Pty Ltd
*/

	class Engineer : BP_BaseFaction
	{
	    name = "Engineer";
		
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
					clothing[] = {"BP_Engineer_F"};
					backpack[] = {};
					vest[] = {};
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
					toolbelt[] = {};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Engineer_1"};
					backpack[] = {"BP_AssaultPack_blk"};
					vest[] = {};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemBandage","ItemBandage"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear {};
				class Backpack : BP_BaseGear {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ItemPainkiller","ItemPainkiller"};
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
					clothing[] = {"BP_Survivalist_2"};
					backpack[] = {"BP_Kitbag_drt"};
					vest[] = {"V_VPack_BP"};
				};
				class Uniform : BP_BaseGear {
					//Array Of Weapons Inside Uniform
					weapons[] = {};
					//Array Of Magazines Inside Uniform
					magazines[] = {"ItemBandage","ItemBandage"};
					//Array Of Items Inside Uniform ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Vest : BP_BaseGear  {
					//Array Of Weapons Inside Backpack
					weapons[] = {};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ItemKnife","BP_15Rnd_9x21_Rubber","BP_15Rnd_9x21_Rubber"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Backpack : BP_BaseGear  {
					//Array Of Weapons Inside Backpack
					weapons[] = {"BP_TranQPistol"};
					//Array Of Magazines Inside Backpack
					magazines[] = {"ItemPainkiller","ItemPainkiller","ItemFieldDressing"};
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
					clothing[] = {"BP_Survivalist_3"};
					backpack[] = {"BP_Kitbag_grs"};
					vest[] = {"V_CPack_BP"};
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
					magazines[] = {"BP_10Rnd_762Rubber_Mag","BP_10Rnd_762Rubber_Mag"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Backpack : BP_BaseGear 
				{
					//Array Of Weapons Inside Backpack
					weapons[] = {"BP_TranQRifle"};
					//Array Of Magazines Inside Backpack
					magazines[] = {"BP_MRT","ItemAntibiotic","ItemDuctTape","ItemKnife"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {"Binocular"};
				};
			};
			class Level_4 : Level_Base {
				class Spawn {
					//Array Of Toolbelt Items
					toolbelt[] = {"ItemMap"};
					//Array Of Random (Clothing,Backpack,Vest)
					primary[] = {};
					launcher[] = {};
					handgun[] = {};
					clothing[] = {"BP_Survivalist_4"};
					backpack[] = {"BP_Kitbag_grs"};
					vest[] = {"V_CPack_BP"};
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
					magazines[] = {"BP_10Rnd_762Rubber_Mag","BP_10Rnd_762Rubber_Mag"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {};
				};
				class Backpack : BP_BaseGear 
				{
					//Array Of Weapons Inside Backpack
					weapons[] = {"BP_TranQRifle"};
					//Array Of Magazines Inside Backpack
					magazines[] = {"BP_MRT","ItemAntibiotic","ItemDuctTape","ItemKnife"};
					//Array Of Items Inside Backpack ( Add to Spawn Toolbelt If they should be assigned )
					items[] = {"Binocular"};
				};
			};
		};
		
		class Points
		{
			base = 0;
			min = -3000;
			max = 6000;
			//Dont Include Level 0 ( Evil ) It's auto detected if < base value.
			levels[] = {0,2000,5000};
			class Aid {
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
					bandage = 5;
					dressing = 10;
					morphine = 10;
					surgery = 25;
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
					food = 10;
					drink = 10;
					bandage = 10;
					dressing = 25;
					morphine = 25;
					surgery = 50;
					gut = -50;
				};
			};
			class Destroy {
				vehicle = 0;
				class None {
					storage = 100;
				};
				class Ranger {
					storage = 100;
				};
				class Nomad {
					storage = 100;
				};
				class Survivalist {
					storage = 100;
				};
				class Outlaw {
					storage = 0;
				};
				class Hunter {
					storage = 100;
				};
				class Engineer {
					storage = 0;
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
					BP_Dog_Ranger = 0;
					BP_Dog_Nomad = 0;
					BP_Dog_Hunter = 0;
					BP_Dog_Outlaw = 0;
					BP_Dog_Engineer = 0;
				};
			};
			class Kill {
				class Ranger {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 50;
					Level_4 = 50;
				};
				class Outlaw {
					Level_0 = 50;
					Level_1 = -200;
					Level_2 = -500;
					Level_3 = -800;
					Level_4 = -800;
				};
				class Hunter {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 50;
					Level_4 = 50;
				};
				class Nomad {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 0;
					Level_4 = 0;
				};
				class Survivalist {
					Level_0 = 0;
					Level_1 = 0;
					Level_2 = 0;
					Level_3 = 0;
					Level_4 = 0;
				};
				class Engineer {
					Level_0 = 50;
					Level_1 = -300;
					Level_2 = -1000;
					Level_3 = -1500;
					Level_4 = -1500;
				};
			};
		};
	};