//
//  Cow.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

struct Cow: Animal {
    var isHungry: Bool = true 
    
    // Conforms to the Animal protocol with a CommodityType of Milk

    func produce() -> Milk {
        return Milk()
    }

    func eat(_: Hay) {

    }
}
