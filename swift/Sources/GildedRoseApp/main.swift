import GildedRose

/// Gilded Rose Inventory of SuperItems
///  SuperItems are regular items that may or not be conjured,
///  The default is an regular item.
///  Setting the parameter as isConjured == true means it is conjured
///  Here in the Gilded Rose....all of our items are `Super`

let superItems = [
    
    //Items
    SuperItem(name: GildedRose.Item.dexterityVest.rawValue, sellIn: 10, quality: 20, isConjured: false, isLegendary: false),
    SuperItem(name: GildedRose.Item.agedBrie.rawValue, sellIn: 2, quality: 0, isConjured: false, isLegendary: false),
    SuperItem(name: GildedRose.Item.elixirMongoose.rawValue, sellIn: 5, quality: 7, isConjured: false, isLegendary: false),
    SuperItem(name: GildedRose.Item.sulfurasRagnaros.rawValue, sellIn: 0, quality: 80, isConjured: false, isLegendary: true),
    SuperItem(name: GildedRose.Item.sulfurasRagnaros.rawValue, sellIn: -1, quality: 80, isConjured: false, isLegendary: true),
    SuperItem(name: GildedRose.Item._TAFKAL80ETCPasses.rawValue, sellIn: 15, quality: 20, isConjured: false, isLegendary: false),
    SuperItem(name: GildedRose.Item._TAFKAL80ETCPasses.rawValue, sellIn: 10, quality: 49, isConjured: false, isLegendary: false),
    SuperItem(name: GildedRose.Item._TAFKAL80ETCPasses.rawValue, sellIn: 5, quality: 49, isConjured: false, isLegendary: false),
    
    // Conjured Items
    SuperItem(name: GildedRose.Item.manaCake.rawValue, sellIn: 3, quality: 6, isConjured: true, isLegendary: false),
    
    ]

/// Initialized GildedRose app
let app = GildedRose(superItems: superItems);


/// Read in number of days of inventory and parameters of items
var days = 6;
if (CommandLine.argc > 1) {
    days = Int(CommandLine.arguments[1])! + 1
}

for i in 0..<days {
    
    print("\n");
    print("--------------------------------- day \(i) ---------------------------------");
    print("|           name           | sell In | Quality | Conjured? | Legendary? |");
    print("-------------------------------------------------------------------------");
    for superItem in superItems {
        print(superItem.details());
    }
    print("");
    
}
 

#warning("For reference, To be removed")
// DEV:
//        for i in 0..<items.count {
//            if (items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
//                if (items[i].quality > 0) {
//                    if (items[i].name != "Sulfuras, Hand of Ragnaros") {
//                        items[i].quality = items[i].quality - 1
//                    }
//                }
//            } else {
//                if (items[i].quality < 50) {
//                    items[i].quality = items[i].quality + 1
//
//                    if (items[i].name == "Backstage passes to a TAFKAL80ETC concert") {
//                        if (items[i].sellIn < 11) {
//                            if (items[i].quality < 50) {
//                                items[i].quality = items[i].quality + 1
//                            }
//                        }
//
//                        if (items[i].sellIn < 6) {
//                            if (items[i].quality < 50) {
//                                items[i].quality = items[i].quality + 1
//                            }
//                        }
//                    }
//                }
//            }
//
//            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
//                items[i].sellIn = items[i].sellIn - 1
//            }
//
//            if (items[i].sellIn < 0) {
//                if (items[i].name != "Aged Brie") {
//                    if (items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
//                        if (items[i].quality > 0) {
//                            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
//                                items[i].quality = items[i].quality - 1
//                            }
//                        }
//                    } else {
//                        items[i].quality = items[i].quality - items[i].quality
//                    }
//                } else {
//                    if (items[i].quality < 50) {
//                        items[i].quality = items[i].quality + 1
//                    }
//                }
//            }
//        }
