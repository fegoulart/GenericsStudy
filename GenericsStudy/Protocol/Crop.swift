//
//  Crop.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

protocol Crop {
    associatedtype FeedType: AnimalFeed where Self.FeedType.CropType == Self
    func harvest() -> FeedType
}
