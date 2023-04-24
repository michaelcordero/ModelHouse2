//
//  SingletonContentViewModel.swift
//  ModelHouse (iOS)
//
//  Created by Michael Cordero on 4/24/23.
//

import Foundation

class SingletonContentViewModel {
    static let shared = ContentViewModel()
    
    private init() {
        // do something...
    }
}
