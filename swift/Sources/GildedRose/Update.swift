import Foundation

class Update {
    
    /// Update parameters of regular stock
    /// - Parameters:
    ///   - regularItems: [<SuperItems>]
    ///   - completionHandler: Result <Success, Failure/Error>
    func regularStock(regularItems: [SuperItem],
                      completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        /// Only modified items that are neither Conjured nor Legendary
        if regularItems.contains(where: {
            $0.isLegendary ||
            $0.isConjured }) {
            completionHandler(.failure(.itemTypeMismatch))
        }
        
        for (_, regItem) in regularItems.enumerated() {
            
            /// Aged brie increases in value
            if regItem.name == GildedRose.Item.agedBrie.rawValue {
                
                /// Normal Sell in range
                if regItem.sellIn > 0  {
                     
                    if regItem.quality >= 50 {
                        regItem.quality = 50
                    } else {
                        regItem.quality += 1
                    }
                    
                    regItem.sellIn -= 1
                    
                }/// Quality increases x2
                else if regItem.sellIn <= 0 {

                    if regItem.quality >= 50 {
                        regItem.quality = 50
                    } else {
                        regItem.quality += 2
                    }
                    
                    regItem.sellIn -= 1
                    
                }
                  
            }
             
            /// Backstage passes  increase in value with exceptions
            if regItem.name == GildedRose.Item._TAFKAL80ETCPasses.rawValue {
            
                /// Normal quality range
                if regItem.sellIn > 10 {
                    
                    if regItem.quality > 50 {
                        regItem.sellIn -= 1
                        regItem.quality = 50
                    }
                    else if regItem.quality == 50 {
                        regItem.sellIn -= 1
                    }
                    else if regItem.quality >= 0 && regItem.quality < 50 {
                        regItem.sellIn -= 1
                        regItem.quality += 1
                    }/// Quality is less than 0
                    else {
                        regItem.sellIn -= 1
                        regItem.quality = 0
                    }
                    
                }/// Quality of the passes increases a bit closer to the concert
                else if regItem.sellIn > 5 && regItem.sellIn <= 10 {
                    
                    if regItem.quality > 50 {
                        regItem.sellIn -= 1
                        regItem.quality = 50
                    }
                    else if regItem.quality == 50 {
                        regItem.sellIn -= 1
                    }
                    else if regItem.quality >= 0 && regItem.quality < 50 {
                        regItem.sellIn -= 1
                        regItem.quality += 2
                    }/// Quality is less than 0
                    else {
                        regItem.sellIn -= 1
                        regItem.quality = 0
                    }
                    
                }/// Quality of the passes increases more closer to the concert
                else if regItem.sellIn >= 0 && regItem.sellIn <= 5  {
                    
                    if regItem.quality > 50 {
                        regItem.sellIn -= 1
                        regItem.quality = 50
                    }
                    else if regItem.quality == 50 {
                        regItem.sellIn -= 1
                    }
                    else if regItem.quality >= 0 && regItem.quality < 50 {
                        regItem.sellIn -= 1
                        regItem.quality += 3
                    }/// Quality is less than 0
                    else {
                        regItem.sellIn -= 1
                        regItem.quality = 0
                    }
                }
                else {
                    regItem.sellIn -= 1
                    regItem.quality = 0
                }
                
            }
            
            /// Update the sellIn and quality
            /// Exclude other regular special needs items
            if regItem.name != GildedRose.Item.agedBrie.rawValue &&
                regItem.name != GildedRose.Item._TAFKAL80ETCPasses.rawValue {
                if regItem.quality > 50 {
                    regItem.quality = 50 - 1//Degrade the quality and reset the max value
                    regItem.sellIn -= 1
                } else if regItem.quality < 0 {
                    regItem.quality = 0 //Degrade the quality and reset the min value
                    regItem.sellIn -= 1
                } else {
                    regItem.quality -= 1
                    regItem.sellIn -= 1
                }
            }
        }
    }
     
    /// Update parameters of Legendary Stock
    /// - Parameters:
    ///   - legendaryItems: [<Legendary>]
    ///   - completionHandler: Result <Success, Failure/Error>
    public func legendaryStock(legendaryItems: [SuperItem],
                   completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        /// Fail /Ignore if any item is not legendary
        if legendaryItems.contains(where: {
            !$0.isLegendary }) {
            completionHandler(.failure(.itemTypeMismatch))
        }
        
        for (_, legItem) in legendaryItems.enumerated() {
             
            /// `...legendary item and as such its Quality is 80 and it never alters`
            if legItem.isLegendary {
                legItem.quality = 80
            }
            
            /// DEV: May be superfluous as this item will not be sold. Spec is unclear
            if legItem.name != GildedRose.Item.sulfurasRagnaros.rawValue &&
                legItem.sellIn > 0 {
                legItem.sellIn -= 1
            }
            ///DEV: All Legendary items are not be sold?
            ///Set sellin to `0`
            else if legItem.sellIn < 0 {
                legItem.sellIn = 0
            }
            
            ///DEV: All Legendary items are not be sold?
            ///Reducce selltin by `1`
            //  else if legItem.sellIn < 0 {
            //      legItem.sellIn = 0
            //  }
        }
        
        completionHandler(.success(legendaryItems))
    }
     
    /// Update parameters of Conjured Stock
    /// - Parameters:
    ///   - conjuredItems: [<Conjured>]
    ///   - completionHandler: Result <Success, Failure/Error>
    public func conjuredStock(conjuredItems: [SuperItem],
                              completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        /// Fail /Ignore if any item is not conjured
        if conjuredItems.contains(where: {
            !$0.isConjured }) {
            completionHandler(.failure(.itemTypeMismatch))
        }
        
        for (_, conItem) in conjuredItems.enumerated() {
            
        ///"Conjured" items degrade in Quality twice as fast as normal items
            if conItem.quality > 50 {
                conItem.sellIn -= 1
                conItem.quality  = 50 - 2
            }/// Quality can never below zero
            else if conItem.quality > 0 && conItem.quality <= 50 {
                conItem.sellIn -= 1
                conItem.quality -= 2
            }
            else {
                conItem.sellIn -= 1
                conItem.quality = 0
            }
        }
        
        completionHandler(.success(conjuredItems))
    }
    

}
