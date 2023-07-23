//
//  FeedType.swift
//  GenericsStudy
//
//  Created by Fernando Goulart on 23/07/23.
//

import Foundation

protocol AnimalFeed {
    associatedtype CropType: Crop where CropType.FeedType == Self // same-type requirement
    static func grow() -> CropType
}
