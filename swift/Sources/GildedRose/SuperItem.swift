import Foundation
 
/// Super Items  the Item parameters + special behavior
public class SuperItem: Item {
     
    /// Item conjured by magic
    /// `Conjured` items degrade in `Quality` twice as fast as normal items
    var isConjured: Bool = false
    
    /// Item is Legendary
    /// `Legendary` items always keep a `Quality` value of `80`
    var isLegendary: Bool = false
    
    /// Unique identifier for each item
    private let id =  UUID().uuidString
    
    public init(name: String,
                  sellIn: Int,
                  quality: Int,
                isConjured: Bool,
                isLegendary: Bool) {
        
        super.init(name: name,
                   sellIn: sellIn,
                   quality: quality)
        
        self.isConjured = isConjured
        
        self.isLegendary = isLegendary

    }
    
    public func details() -> String {
        return "\(self.name), \(self.sellIn), \(self.quality), \(self.isConjured), \(self.isLegendary), \(id)"
    }
     
}
