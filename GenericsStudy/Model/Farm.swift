//
//  Farm.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

struct Farm {
    var animals: [any Animal] // heterogenous array of 'any Animal'. Can store any concrete type of animal dynamically

    var isLazy = true

    func produceCommodities() -> [any Food] {

        return animals.map { animal in
            // produce method is called on an 'any Animal', so the return type is type erased returning 'any Food'
            animal.produce() // When we call a method returning an associated type on an existential type, the compiler will use type erasure to determine the result type of the call
        }
    }
}

extension Farm {
    // var hungryAnimals: LazyFilterSequence[any Animal] {
    // var hungryAnimals: some Collection { // too broad
    var hungryAnimals: some Collection<any Animal> { // constrained opaque type
        animals.lazy.filter(\.isHungry) // avoids temporary allocation
    }

    var hungryAnimals2: any Collection<any Animal> { // use 'any' when different types can be returned
        if isLazy {
            return animals.lazy.filter(\.isHungry)
        } else {
            return animals.filter(\.isHungry)
        }
    }

    func feedAnimals() {
        for animal in hungryAnimals {
            // animal.eat(???)
            feedAnimal(animal)
        }
    }

    private func feedAnimal(_ animal: some Animal) { // some here is to unbox an associated type in consuming position
        let crop = type(of: animal).FeedType.grow()
        let feed = crop.harvest() // before same type requirements was returns (some Animal).FeedType.CropType.FeedType
        animal.eat(feed) // eat method expects (some Animal).FeedType
    }
}
