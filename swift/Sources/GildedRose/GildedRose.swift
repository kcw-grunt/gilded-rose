
public class GildedRose {
    
    /// Item name to remove typos and preserve the raw string
    public enum Item: String {
        case dexterityVest = "+5 Dexterity Vest"
        case agedBrie = "Aged Brie"
        case elixirMongoose = "Elixir of the Mongoose"
        case sulfurasRagnaros = "Sulfuras, Hand of Ragnaros"
        case _TAFKAL80ETCPasses = "Backstage passes to a TAFKAL80ETC concert"
        case manaCake = "Conjured Mana Cake" 
    }
    
    var superItems: [SuperItem]
    
    public required init(superItems:[SuperItem]) {
        self.superItems = superItems
    }  
    
    /// Update Quality
    /// - Parameter superItems: Array of SuperItems `[SuperItems]`
    /// - Returns: Resutlt <Success, Failure/Error>
    public func updateQuality(completionHandler: @escaping (Result<Bool, ProgramError>) -> Void) {
        
        var updatedSuperItems = [SuperItem]()
        
        /// Creates an array of regular items that have `normal` behavior
        let regularItems = self.superItems.filter {
                $0.isLegendary == false &&
                $0.isConjured == false }
        
        /// Call the function to update the Regular Items
        Update().regularStock(regularItems: regularItems) { result in
            switch result {
                case .success(let regulars):
                    updatedSuperItems += regulars
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
  
        /// Creates an array of Legendary Items
        let legendaryItems = self.superItems.filter { $0.isLegendary == true }
        
        /// Call the function to update the Sulfrases Stock
        Update().legendaryStock(legendaryItems: legendaryItems) { result in
            switch result {
                case .success(let legends):
                    updatedSuperItems += legends
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
        
        /// Creates an array of Conjured Items
        let conjuredItems = self.superItems.filter { $0.isConjured == true }
        
        /// Call the function to update the Sulfrases Stock
        Update().conjuredStock(conjuredItems: conjuredItems) { result in
            switch result {
                case .success(let legends):
                    updatedSuperItems += legends
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
          
        completionHandler(.success(true))
    }
    
}

