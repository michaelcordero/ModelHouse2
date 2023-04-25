//
//  ModelName.swift
//  ModelHouse
//
//  Created by Michael Cordero on 3/29/23.
//

import Foundation

enum ModelName: String {
    case DeepQ = "dqn"
    case DynaQ = "dynaq"
    case SentK = "sentk"
    
    static func fromString(_ string: String) -> ModelName? {
        return ModelName(rawValue: string)
    }
}
