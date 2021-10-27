import Foundation
 
/// Super Items  the Item parameters + Conjuring behavior
public class SuperItem: Item {
     
    var isConjured: Bool = false
    
    override init(name: String,
                  sellIn: Int,
                  quality: Int) {
        
        super.init(name: name,
                   sellIn: sellIn,
                   quality: quality)

    }
    
    func superItemDetails() -> String {
        return "\(self.name), \(self.sellIn), \(self.quality), \(self.isConjured)"
    }
     
}
