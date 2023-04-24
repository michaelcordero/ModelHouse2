//
//  StockView.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/23/23.
//

import SwiftUI

struct StockView: View {
    @ObservedObject var model = SingletonContentViewModel.shared
    @State private var models: ModelOptions? = nil
    
    var symbol: String
    
    
    var body: some View {
        VStack {
            HStack {
                    let stock_data: StockData = model.stockData.filter({$0.metaData.symbol == symbol}).first!
                
                LineChart(values: stock_data.closeValues)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.green.opacity(0.7), .green.opacity(0.2),
                                .green.opacity(0)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 430, height: 300)
                
                Spacer()
            }
            Text("Model Type")
            HStack {
                DropDown(selectedOption: self.$models,
                         placeHolder: "Select Your Model",
                         options: ModelOptions.testingAllModel)
                
                Text(models?.option ?? "")
                Spacer()
            }
            /*HStack {
                
            }*/
        }.navigationTitle(symbol)
        
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(symbol: "")
    }
}
