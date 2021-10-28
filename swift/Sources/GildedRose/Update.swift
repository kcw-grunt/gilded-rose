import Foundation

class Update {
    
    func vestStock(vestItems: [SuperItem],
                     completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        if vestItems.contains(where: {
            $0.name != GildedRose.Item.dexterityVest.rawValue ||
                $0.isLegendary ||
                $0.isConjured }) {
            
                    completionHandler(.failure(.itemTypeMismatch))
        }
    }
    
    func brieStock(brieItems: [SuperItem],
                   completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        if brieItems.contains(where: {
                $0.name != GildedRose.Item.agedBrie.rawValue ||
                $0.isLegendary ||
                $0.isConjured }) {
            
                    completionHandler(.failure(.itemTypeMismatch))
        }
    }
    
    func sulfrasStock(sulfrasItems: [SuperItem],
                   completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        if sulfrasItems.contains(where: {
                $0.name != GildedRose.Item.sulfurasRagnaros.rawValue ||
                $0.isLegendary ||
                $0.isConjured }) {
            
                    completionHandler(.failure(.itemTypeMismatch))
        }
    }
    
    func backstagePassesStock(passItems: [SuperItem],
                   completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        if passItems.contains(where: {
            $0.name != GildedRose.Item._TAFKAL80ETCPasses.rawValue ||
                $0.isLegendary ||
                $0.isConjured }) {
            
            completionHandler(.failure(.itemTypeMismatch))
        }
    }
    
    func regularStock(regularItems: [SuperItem],
                   completionHandler: @escaping (Result<[SuperItem], ProgramError>) -> Void)  {
        
        
    }
}
