//
//  Grass.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

struct Hay: AnimalFeed {
    static func grow() -> Alfalfa {
        Alfalfa()
    }
}
