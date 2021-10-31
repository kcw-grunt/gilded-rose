# Gilded Rose (Swift)

## Refactor Overview

Let us take a moment of silence for Leeroy who worked hard on the Gilded Rose inventory system yet met his demise in a fiery blaze of glory.  We will always remmber him for his love of chicken.

Reviewing the spec, it was clear there needed to be a way to capture items that had attributes beyond the standard yet the exceptions needed tests to also allow flexibilty in the custom items.  This following details some of the steps to acheive this.


## Items and SuperItems

As we avoid the ire of the orge the original class was untouched yet a superclass was created to cover the Conjured and Legendary items.
So, inventory is separated into 3 groups `Regular`, `Conjured` and `Legendary`


|Regular|Conjured|Legendary|
|:------:|:------:|:------:|
|Elixir of the Mongoose|Conjured Mana Cake|Sulfuras, Hand of Ragnaros| 
|+5 Dexterity Vest| | |
|Aged Brie| | |
|Backstage passes to a TAFKAL80ETC concert| | |
||||

## Approach

The expections in the instructions from management suggest this style will persist so notes and separation of concerns were followed as best as possible

- Comments and explanations were added within reason
- Subgroups were updated separately
- Exceptions where handled based on the spec.
- Hidden expectaions were assumed based on the legacy system

## Testing

A set of tests were written to cover the business logic but there was not enough time to capture all corner cases. There were some test cases that should be considered to more thouroughly verify the design. Some tests if more time was spent:

- Add tests to check the value boundaries
- Add tests to check the hidden value decrease after sellin < 0
- Add tests to test limits of large numbers to anticpate higher O(n) complexity
- Add more formatted outputs for the end user to improve readability

## Notes

Modifying line 44 in main.swift to:

``` print(superItem.details());```

will print all parameters to include item UUID.

 

-------------------------------------------------------------
## Legacy Instructions
---
## Running Swift

To build and run:

    git clone https://github.com/notonthehighstreet/gilded-rose.git
    cd gilded-rose/swift/
    swift run
    
To adjust number of days:

    swift run GildedRoseApp 5
    
<sup>Replace 5 with your value</sup>

To build and run tests:

    swift test

### Install Swift

https://swift.org/getting-started/#installing-swift

## Using Xcode

You can open the `Package.swift` file in Xcode to build and run the project if you prefer. When running the application from Xcode it will default to printing the first 2 days in the console. To adjust this add an Integer environmental variable to the `GildedRose` build scheme:

<img width="773" alt="Screenshot 2021-05-21 at 11 05 33" src="https://user-images.githubusercontent.com/630601/119180032-9fc7c780-ba67-11eb-849c-78e0bf691fd9.png">
