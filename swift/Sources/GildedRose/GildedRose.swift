
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
    
    /// Update Qualtiy
    /// - Parameter superItems: Array of SuperItems `[SuperItems]`
    /// - Returns: Resutlt <Success, Failure/Error>
    func updateQuality(completionHandler: @escaping (Result<Bool, ProgramError>) -> Void) {
        
        var updatedSuperItems = [SuperItem]()
        
        /// Creates an array of `+5 Dexterity Vests`
        let dexterityVests = self.superItems.filter { $0.name == Item.dexterityVest.rawValue }
        
        /// Call the function to update the Vest Stock
        Update().vestStock(vestItems: dexterityVests) { result in
            switch result {
                case .success(let vests):
                    updatedSuperItems += vests
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
        
        /// Creates an array of `Aged Bries`
        let bitsOfBrie = self.superItems.filter { $0.name == Item.agedBrie.rawValue }
        
        /// Call the function to update the Brie Stock
        Update().brieStock(brieItems: bitsOfBrie) { result in
            switch result {
                case .success(let bries):
                    updatedSuperItems += bries
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
        
        /// Creates an array of `Sulfurases, Hand of Ragnaros`
        let sulfuras = self.superItems.filter { $0.name == Item.sulfurasRagnaros.rawValue }
        
        /// Call the function to update the Sulfrases Stock
        Update().sulfrasStock(sulfrasItems: sulfuras) { result in
            switch result {
                case .success(let bries):
                    updatedSuperItems += bries
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
        
        /// Creates an array of `Backstage passes to a TAFKAL80ETC concert`
        let backstagePasses = self.superItems.filter { $0.name == Item._TAFKAL80ETCPasses.rawValue}
        
        /// Call the function to update the Brie Stock
        Update().backstagePassesStock(passItems: backstagePasses) { result in
            switch result {
                case .success(let passes):
                    updatedSuperItems += passes
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
        
        /// Creates an array of regular items that have normal behavior
        let regularItems = self.superItems.filter { $0.name != Item.dexterityVest.rawValue &&
            $0.name != Item.agedBrie.rawValue &&
            $0.name != Item.sulfurasRagnaros.rawValue &&
            $0.name != Item._TAFKAL80ETCPasses.rawValue }
        
        /// Call the function to update the Brie Stock
        Update().regularStock(regularItems: regularItems) { result in
            switch result {
                case .success(let regulars):
                    updatedSuperItems += regulars
                case .failure(let programError):
                    completionHandler(.failure(programError))
            }
        }
        
        completionHandler(.success(true))
    }
    
}

