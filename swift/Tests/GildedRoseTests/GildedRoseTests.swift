import Foundation
import XCTest

@testable import GildedRose

class GildedRoseTests: XCTestCase {
    
    //MARK: - Variables

    let legendaryGood = SuperItem(name: GildedRose.Item.dexterityVest.rawValue,
                                  sellIn: 5,
                                  quality: 70,
                                  isConjured: false,
                                  isLegendary: true)
    
    let legendaryBad = SuperItem(name: GildedRose.Item.dexterityVest.rawValue,
                                 sellIn: 5,
                                 quality: 50,
                                 isConjured: false,
                                 isLegendary: true)
    
    let legendarySulfuras = SuperItem(name: GildedRose.Item.sulfurasRagnaros.rawValue,
                                 sellIn: -1,
                                 quality: 80,
                                 isConjured: false,
                                 isLegendary: true)
    
    let regularGoodVest = SuperItem(name: GildedRose.Item.dexterityVest.rawValue,
                                      sellIn: 20,
                                      quality: 9,
                                      isConjured: false,
                                      isLegendary: false)
    
    let regularBadVest = SuperItem(name: GildedRose.Item.dexterityVest.rawValue,
                                    sellIn: -8,
                                    quality: 56,
                                    isConjured: false,
                                    isLegendary: false)
    
    let regularBrie = SuperItem(name: GildedRose.Item.agedBrie.rawValue,
                                   sellIn: 18,
                                   quality: 20,
                                   isConjured: false,
                                   isLegendary: false)
    
    let regularPasses = SuperItem(name: GildedRose.Item._TAFKAL80ETCPasses.rawValue,
                                   sellIn: 10,
                                   quality: 48,
                                   isConjured: false,
                                   isLegendary: false)
    
    let goodCake = SuperItem(name: GildedRose.Item.manaCake.rawValue,
                                  sellIn: 30,
                                  quality: 48,
                                  isConjured: true,
                                  isLegendary: false)
    
    let badCake = SuperItem(name: GildedRose.Item.manaCake.rawValue,
                             sellIn: 30,
                             quality: 4,
                             isConjured: true,
                             isLegendary: false)
    
    var mixedItems: [SuperItem] = []
    var conjuredItemsList: [SuperItem] = []
    var legendaryItemsList: [SuperItem] = []
    
    var app = GildedRose(superItems: [])


    override func setUp() {
        
        mixedItems = [legendaryGood, legendaryBad,
                      legendarySulfuras, regularGoodVest,
                      regularBadVest, regularBrie, regularPasses,
                      badCake, goodCake]
        
        conjuredItemsList = [badCake, goodCake]
        
        legendaryItemsList = [legendaryGood, legendaryBad]
        
    }
    
    override func tearDown() {
        
        mixedItems = []
        conjuredItemsList = []
        legendaryItemsList = []
    }
    
    
    //MARK: - Tests

    func testLegendaryItems() {
         
        Update().legendaryStock(legendaryItems: [legendaryGood]) { result in
            switch result {
                case .success(let legends):
                    XCTAssertTrue(legends.count == 1)
                    XCTAssertTrue(legends.first?.isLegendary == true)
                case .failure(let programError):
                    print(programError.localizedDescription)
                    XCTFail("The message should never print")
            }
        }
        
        Update().legendaryStock(legendaryItems: [legendaryBad,legendaryGood,legendarySulfuras]) {
            result in
            switch result {
                case .success(let legends):
                    XCTAssertTrue(legends.filter{ $0.quality == 80 }.count == 3)
                    XCTAssertTrue(legends.last?.sellIn == 0)
                case .failure(let programError):
                    print(programError.localizedDescription)
                    XCTFail("The message should never print")
            }
        } 
    }
    
    func testRegularItems() {
        
        let listRegulars = [regularGoodVest,
                            regularBadVest,
                            regularBrie,
                            regularPasses]
        
        Update().regularStock(regularItems: listRegulars ) { result in
            switch result {
                case .success(let legends):
                    XCTAssertTrue(legends.count == 1)
                    XCTAssertTrue(legends.first?.isLegendary == true)
                case .failure(let programError):
                    print(programError.localizedDescription)
                    XCTFail("The message should never print")
            }
        }
    }
    
    func testConjuredItems() {
         
        Update().conjuredStock(conjuredItems: conjuredItemsList) { result in
            switch result {
                case .success(let conjured):
                    XCTAssertTrue(conjured.count == 2)
                case .failure(let programError):
                    print(programError.localizedDescription)
                    XCTFail("The message should never print")
            }
        }
        
    }
    
    func testAppEdges() {
        
        app.updateQuality { result in
            
            switch result {
                case .success(let noSuccess):
                    XCTAssertTrue(noSuccess == true)
                case .failure(let programError):
                    XCTAssertTrue(programError == ProgramError.noDataEntered)
            }
        }
        
        app.superItems = mixedItems
        
        app.updateQuality { result in
            
            switch result {
                case .success(let success):
                    XCTAssertTrue(success == true)
                case .failure(let programError):
                    XCTAssertNil(programError)
            }
        }
    }
    
}
