
public class GildedRose {
    var superItems: [SuperItem]
    
    public required init(superItems:[SuperItem]) {
        self.superItems = superItems
    }
    
    //TODO: Refactor method
    #warning("WIP : Refactor method")

    static public func updateQuality(superItems: [SuperItem]) -> (Result<Any, Error>) {
        
    #warning("WIP : add business logic")

        return .success(true)
    }
}
