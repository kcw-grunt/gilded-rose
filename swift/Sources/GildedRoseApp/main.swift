import GildedRose


/// Gilded Rose Inventory of SuperItems
///  SuperItems are regular items that may or not be conjured,
///  The default is an regular item.
///  Setting the parameter as isConjured == true means it is conjured
///  Here in the Gilded Rose....all of our items are `Super`

let superItems = [
    
    //Items
    SuperItem(name: "+5 Dexterity Vest", sellIn: 10, quality: 20, isConjured: false),
    SuperItem(name: "Aged Brie", sellIn: 2, quality: 0, isConjured: false),
    SuperItem(name: "Elixir of the Mongoose", sellIn: 5, quality: 7, isConjured: false),
    SuperItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80, isConjured: false),
    SuperItem(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80, isConjured: false),
    SuperItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20, isConjured: false),
    SuperItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49, isConjured: false),
    SuperItem(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49, isConjured: false),
    
    // Conjured Items
    SuperItem(name: "Conjured Mana Cake", sellIn: 3, quality: 6, isConjured: true),
    
    ]

/// Initialized GildedRose app
let app = GildedRose(superItems: superItems);


/// Read in number of days of inventory and parameters of items
var days = 2;
if (CommandLine.argc > 1) {
    days = Int(CommandLine.arguments[1])! + 1
}

//TODO: Refactor using better formatting and SuperItems
/// Print Inventory to console and update quality
//for i in 0..<days {
//    print("-------- day \(i) --------");
//    print("name, sellIn, quality");
//    for superItem in superItems {
//        <#body#>
//    } in items {
//        print(item);
//    }
//    print("");
//    app.updateQuality();
//}


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
