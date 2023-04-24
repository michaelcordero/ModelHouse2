//
//  ModelOptions.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/23/23.
//

import Foundation

struct ModelOptions: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension ModelOptions {
    static let testingSingleModel: ModelOptions = ModelOptions(option: "DynaQ")
    static let testingAllModel: [ModelOptions] = [
    
    ModelOptions(option: "DynaQ"),
    ModelOptions(option: "DQN"),
    ModelOptions(option: "SentK")
    ]
}
