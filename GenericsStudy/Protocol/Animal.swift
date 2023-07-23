//
//  Animal.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

//protocol Animal { -> doesn't work
//    func produce() -> Food
//}

protocol Animal {
    // Protocol 'Self' type stands in for the actual concrete type conforming to the 'Animal' protocol
    // Self type has an associate 'Commodity' type conforming to Food

    associatedtype CommodityType: Food //  By using an associatedtype we're declaring that given some concrete type of Animal, calling produce returns some specific type of Food that depends on the concrete Animal type

    func produce() -> CommodityType

    associatedtype FeedType: AnimalFeed

    var isHungry: Bool { get }

    func eat(_: FeedType)
}
