//
//  Stocks.swift
//  ModelHouse
//
//  Created by Michael Cordero on 3/29/23.
//

import Foundation

enum Stocks: String {
    case TSLA = "tsla"
    case AAPL = "aapl"
    case JPM = "jpm"
    
    static func fromString(_ string: String) -> Stocks? {
        return Stocks(rawValue: string)
    }
}
