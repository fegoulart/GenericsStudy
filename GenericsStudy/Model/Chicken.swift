//
//  Chicken.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

struct Chicken: Animal {
    var isHungry: Bool = true

    // Conforms to the Animal protocol with a CommodityType of Egg

    func produce() -> Egg {
        return Egg()
    }

    func eat(_ : Scratch) {
        
    }
}
