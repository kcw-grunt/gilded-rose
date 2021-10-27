import Foundation
 
/// Super Items  the Item parameters + Conjuring behavior
public class SuperItem: Item {
     
    var isConjured: Bool = false
    
    public init(name: String,
                  sellIn: Int,
                  quality: Int,
                isConjured: Bool) {
        
        super.init(name: name,
                   sellIn: sellIn,
                   quality: quality)
        
        self.isConjured = isConjured

    }
    
    func superItemDetails() -> String {
        return "\(self.name), \(self.sellIn), \(self.quality), \(self.isConjured)"
    }
     
}
