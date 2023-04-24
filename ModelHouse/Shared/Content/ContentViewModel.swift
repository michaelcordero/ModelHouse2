//
//  ContentViewModel.swift
//  ModelHouse
//
//  Created by Jonas Toussaint on 4/10/23.
//

import Foundation
import SwiftUI
import Combine

final class ContentViewModel: ObservableObject {
    private let context = PersistenceController.shared.container.viewContext
    
    private var cancellables = Set<AnyCancellable>()
   
    @Published var stockData: [StockData] = []
    @Published var symbol = ""
    @Published var stockEntities:[StockEntity] = []
    @Published var symbolValid = false
    
    init() {
        loadfromCoreData()
        loadAllSymbols()
        validateSymbolField()
    }
    
    func validateSymbolField() {
        $symbol
            .sink { [unowned self] newValue in
                self.symbolValid = !newValue.isEmpty
            }
            .store(in: &cancellables)
    }
    
    func loadfromCoreData() {
        do {
            stockEntities = try context.fetch(StockEntity.fetchRequest())
        } catch {
            print(error)
        }
    }
    
    func addStock() {
        let newStock = StockEntity(context: context)
        newStock.symbol = symbol
        
        stockEntities.append(newStock)
        getStockData(for: symbol)
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        
        
        symbol = ""
    }
    
    func delete(at indexSet: IndexSet){
        //print(indexSet.first)
        guard let index = indexSet.first else { return }
        stockData.remove(at: index)
        let stockToRemove = stockEntities.remove(at: index)
        
        context.delete(stockToRemove)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func loadAllSymbols() {
        stockData = []
        stockEntities.forEach { stockEntity in
            getStockData(for: stockEntity.symbol ?? "")
        }
    }
    
    func getStockData(for symbol: String) {
        let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=5min&apikey=\(APIKEY)")!
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: StockData.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    return
                case .finished:
                    return
                }
            } receiveValue: { [unowned self] stockData in
                DispatchQueue.main.sync {
                    self.stockData.append(stockData)
                }
                //self.stockData.append(stockData)
            }
            .store(in: &cancellables)
    }
}


