#define Main

posx = x;
posy = y;

global.spr_fishing_machine = sprite_add("sprites/structures/fishingmachine.png", 1, false, false, 16, 16)
global.spr_test_item = sprite_add("sprites/rod.png", 1, false, false, 9, 9)
global.spr_string = sprite_add("sprites/string.png", 1, false, false, 9, 9)
global.spr_reinforced_string = sprite_add("sprites/reinforcedstring.png", 1, false, false, 9, 9)
global.spr_wood_rod = sprite_add("sprites/rod.png", 1, false, false, 9, 9)
global.spr_iron_rod = sprite_add("sprites/ironrod.png", 1, false, false, 9, 9)
global.spr_rod_bench = sprite_add("sprites/structures/rodbench.png", 1, false, false, 16, 16)
global.spr_reinforced_wood_rod = sprite_add("sprites/reinforcedrod.png", 1, false, false, 9, 9)

// Fishing Progress for the Rod
global.fishingprogress = 0

// Maximum number which can be fished by The Auto Fishing Machine
global.maxedfishingnumber = 300

// Minimum number which can be fished by The Auto Fishing Machine
global.minfishingnumber = 0

// Maximum Range 1 of the Auto Fishing Machine
global.maximum1 = 83

global.fishingSpeed = 1


modloaded = "Fishing|   Loaded Herobrine`s Fishing Mod"
modloaded2 = "Fishing|   Special Thanks to rarbin!"
spaceholder = "----------------------------------------------------------------"
version = "Version: V.1.5a"
newest = "Newest:"
newesttext = "Better Messages, Fished items by Fishing Machine now more rare"

testitemname = "Test Item"
testitemdesc = "A Item for testing my mod"

//Loaded Messages
Trace(spaceholder)
Trace(modloaded)
Trace(modloaded2)
Trace(version)
Trace(newest)
Trace(newesttext)
Trace(spaceholder)


   // ItemEdit(Item.Fiber, , [Item.Flower, 5])

    // Create a new item
    global.itemTestItem = ItemCreate(
    //should stay undefined
    undefined,
     //name of the Item
    "Test Item",
    //description of the item
    "Test",
    //Sprite of the item
    global.spr_test_item,
    //ItemType
    ItemType.Material,
    //ItemSubType
    ItemSubType.None,
    //Sell Value
    0,
    //Healing Value
    0,
    //Energy Value
    0,
    //Blueprint (Recipe)
    [Item.IronIngot, 20, Item.NightShade, 5],
    //ScriptWrapper
    ScriptWrap(doTest),
    //Crafting Time
    60 * 1,
    //Unlocked (true/false)
    false
    );
    
    //String
    
    global.itemString = ItemCreate(
    undefined,
    "String",
    "Used to Craft Fishing Rods",
    global.spr_string,
    ItemType.Material,
    ItemSubType.None,
    0,
    0,
    0,
    [Item.Fiber, 5, Item.Coal, 5],
    ScriptWrap(doTest),
    60 * 10,
    true
    );
    
    //Reinforced String
    
    global.itemReinforcedString = ItemCreate(
    undefined,
    "Reinforced String",
    "Used to Craft Better Fishing Rods",
    global.spr_reinforced_string,
    ItemType.Material,
    ItemSubType.None,
    0,
    0,
    0,
    [global.itemString, 5, Item.IronIngot, 5, Item.Coal, 10],
    ScriptWrap(doTest),
    60 * 10,
    true
    );
    
    //Basic Rod
    
    global.itemBasicRod = ItemCreate(
    undefined,
    "Basic Rod",
    "Lets start fishing together (70)",
    global.spr_wood_rod,
    ItemType.Gear,
    ItemSubType.None,
    0,
    0,
    0.1,
    [Item.Wood, 50, global.itemString, 5],
    ScriptWrap(fishing),
    180 * 10,
    true
    );
    
    //Reinforced Wood Rod
    
    global.itemReinforcedWoodRod = ItemCreate(
    undefined,
    "Reinforced Wood Rod",
    "Now you can get Ingots and Gems from Fishing! (65)",
    global.spr_reinforced_wood_rod,
    ItemType.Gear,
    ItemSubType.None,
    0,
    0,
    0.1,
    [Item.Wood, 100, global.itemString, 10],
    ScriptWrap(fishing),
    180 * 10,
    true
    );
    
    //Iron Rod

    global.itemIronRod = ItemCreate(
    undefined,
    "Iron Rod",
    "Now you can get Anchor from Fishing! (60)",
    global.spr_iron_rod,
    ItemType.Gear,
    ItemSubType.None,
    0,
    0,
    0,
    [Item.IronIngot, 50, global.itemReinforcedString, 5],
    ScriptWrap(fishing),
    180 * 10,
    true
    );

    //Reinforced Iron Rod
      
    global.itemReinforcedIronRod = ItemCreate(
    undefined,
    "Reinforced Iron Rod",
    "Now you can get more Items from Fishing! (55)",
    global.spr_iron_rod,
    ItemType.Gear,
    ItemSubType.None,
    0,
    0,
    0,
    [Item.IronIngot, 100, global.itemReinforcedString, 10],
    ScriptWrap(fishing),
    180 * 10,
    true
    );

    global.gearCategoryRods = GearCategoryCreate(
    //should stay undefined
    undefined,
    //Name of the Category
    "Rods",
    //Items for Toolbar (true/false)
    true,
    //Rotate like a sword (true/false)
    false
    );
    
    GearCategoryAddItems(
        //Category where items should be added
        global.gearCategoryRods,
        //Items which should be added starts here
        global.itemBasicRod,
        global.itemReinforcedWoodRod,
        global.itemIronRod,
        global.itemReinforcedIronRod
        );

    CommandCreate("AutoFishingSpeed", true, ScriptWrap(setAutoFishingSpeed), "Speed")

           
    // Furnace
    
 //   StructureAddItem(Structure.Furnace, Item.Fiber)
    
           
    //Rod Crafting Bench

    global.rodBench = StructureCreate(
    undefined,
    "Rod Bench",
    "Here you can Craft Rods and Stuff for them!",
    StructureType.Base,
    global.spr_rod_bench,
    undefined,
    [Item.Wood, 10, Item.IronIngot, 10],
    2,
    true,
    [global.itemString, global.itemReinforcedString, global.itemBasicRod],
    true,
    BuildMenuCategory.Farming,
    [global.gearCategoryRods])

    
    //Auto Fishing Machine

    global.fishingmachine = StructureCreate(
    undefined,
    "Fishing Machine",
    "It automatically fishes for you!",
    StructureType.Base,
    global.spr_fishing_machine,
    undefined,
    [Item.IronIngot, 100, Item.GoldIngot, 100, global.itemReinforcedString, 5],
    2,
    false,
    undefined,
    true,
    BuildMenuCategory.Farming,
    undefined)

//    StructureAddItem()
#define doTest
    if(x == 1){
        posy = 2
    }

#define setAutoFishingSpeed(speednum)
    //Trace(speednum[0])
    global.fishingSpeed = real(speednum[0])
    Trace("Set Auto Fishing Speed to: "+speednum[0])

    
#define OnStructureSpawn(inst, structure)

if (structure == global.fishingmachine){
    InstanceAddVariable(inst, "FishingFrames")
    InstanceAddVariable(inst, "FishingSecs")
    //Trace(inst.id)
    InstanceAssignMethod(inst, "step", ScriptWrap(AutoFishingStep), true)
}
   
    
#define AutoFishingStep
var FishingFrames, FishingSecs, _fishingnumber, _randomnumber;

var maxedfishingnumber = global.maxedfishingnumber
var minfishingnumber = global.minfishingnumber
var maximum1 = global.maximum1

FishingFrames = variable_instance_get(id ,"FishingFrames", 0)
//Trace(inst)

if (FishingFrames != undefined){
 FishingFrames ++;   
} else {
    FishingFrames = 0
}

//Trace(FishingFrames)

FishingSecs = FishingFrames / (600 / real(global.fishingSpeed));

if (FishingSecs >= 1){
    FishingFrames = 0;

    //Trace(id)
    //Trace("Fishing Machine| Fished ")
    
    _fishingnumber = irandom_range(minfishingnumber, maxedfishingnumber); 
    if(_fishingnumber >= maximum1){
        _randomnumber = irandom_range(1, 3)
        if(_randomnumber == 1) {
            _fishingnumber = 22
        } else if (_randomnumber == 2){
            _fishingnumber = 67
        } else if (_randomnumber == 3){
            _fishingnumber = 68
        } else {
            _fishingnumber = 67
        }
        
    } else {
        
    }
    DropItem(x, y, _fishingnumber, 1)
    
    //Rare Items
    if (_fishingnumber == 52){
        Trace("[FISHING MACHINE] Rare Catch: Golden Egg")
    } else if (_fishingnumber == 51) {
        Trace("[FISHING MACHINE] Rare Catch: Sunken Ankh")
    } else if (_fishingnumber == 50) {
        Trace("[FISHING MACHINE] Rare Catch: Anchor")
    } else if (_fishingnumber == 49) {
        Trace("[FISHING MACHINE] Rare Catch: Frozen Relic")
    } else if (_fishingnumber == 48) {
        Trace("[FISHING MACHINE] Rare Catch: Kapala")
    } else if (_fishingnumber == 47) {
        Trace("[FISHING MACHINE] Rare Catch: Sphynx")
    } else if (_fishingnumber == 46) {
        Trace("[FISHING MACHINE] Rare Catch: Fossil")
    } else {
        
    }
    
}
variable_instance_set(id,"FishingFrames", FishingFrames)

return null