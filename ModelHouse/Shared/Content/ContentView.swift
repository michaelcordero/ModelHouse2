//
//  ContentView.swift
//  Shared
//
//  Created by Jonas Toussaint on 4/3/23.
//

import SwiftUI
import CoreData

/*struct ContentView: View {
    @ObservedObject private var model = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    TextField("Symbol", text: $model.symbol)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add", action: model.addStock)
                        .disabled(!model.symbolValid)
                }
                
                if !model.stockData.isEmpty {
                    ForEach(model.stockData) { stock in
                        HStack {
                            
                            Text(stock.metaData.symbol)
                            
                            Spacer()
                            
                            LineChart(values: stock.closeValues)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.green.opacity(0.7), .green.opacity(0.2),
                                            .green.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(width: 150, height: 50)
                            
                            VStack(alignment: .trailing) {
                                Text(stock.latestClose)
                               
                            }
                           .frame(width: 100)
                        }
                    }.onDelete(perform: model.delete(at:))
                }
            }
            .navigationTitle("My Watchlist")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                    // TODO: Edit Button doesn't exist. You probably want NavigationLink to take you to a detailed view of the stock and then be able to select a model from within that screen.
                
                }
            }
        }
    }
}
*/
    
struct ContentView: View {
    var body: some View {
        TabView {
        
            Home()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Watchlist()
                .tabItem() {
                    Image(systemName: "eye.fill")
                    Text("Watchlist")
                }
            Portfolio()
                .tabItem() {
                    Image(systemName: "chart.pie.fill")
                    Text("Portfolio")
                }
            Trade()
                .tabItem() {
                    Image(systemName: "arrow.up.arrow.down")
                    Text("Trade")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
