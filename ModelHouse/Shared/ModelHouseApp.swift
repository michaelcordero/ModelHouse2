//
//  ModelHouseApp.swift
//  Shared
//
//  Created by Jonas Toussaint on 4/19/23.
//

import SwiftUI

@main
struct ModelHouseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            SplashScreenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
