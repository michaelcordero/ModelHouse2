//
//  StockData.swift
//  ModelHouse
//
//  Created by Jonas Toussaint on 4/10/23.
//

import Foundation
import CoreData


// MARK: - MetaData
struct StockData: Codable, Identifiable {
    struct MetaData: Codable {
        var information: String
        var symbol: String
        var lastRefreshed: String
        var interval: String
        var outputSize: String
        var timeZone: String
    
                        
      private enum CodingKeys: String, CodingKey {
          case information = "1. Information"
          case symbol = "2. Symbol"
          case lastRefreshed = "3. Last Refreshed"
          case interval = "4. Interval"
          case outputSize = "5. Output Size"
          case timeZone = "6. Time Zone"
      }
  }

    struct StockDataEntry: Codable {
        let open: String
        let high: String
        let low: String
        let close: String
        let volume: String
        
        private enum CodingKeys: String, CodingKey {
            case open = "1. open"
            case high = "2. high"
            case low = "3. low"
            case close = "4. close"
            case volume = "5. volume"
        }
    }


    let id = UUID()
    
    let metaData: MetaData
    let timeSeries5min: [String: StockDataEntry]
    
    var latestClose: String {
        timeSeries5min.first?.value.close ?? "NaN"
    }

    var closeValues: [Double] {
        let rawValues = timeSeries5min.values.map { Double($0.close)! }
        let max = rawValues.max()!
        let min = rawValues.min()!
        
        return rawValues.map { ($0 - min * 0.95) / (max - min * 0.95) }
    }
    
private enum CodingKeys: String, CodingKey {
    case metaData = "Meta Data"
    case timeSeries5min = "Time Series (5min)"
    }
}
