//
//  Trade.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/19/23.
//

import SwiftUI

struct Trade: View {
    var body: some View {
        ZStack {
            
            Color.blue
            
            Image(systemName: "arrow.up.arrow.down")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        }
    }
}

struct Trade_Previews: PreviewProvider {
    static var previews: some View {
        Trade()
    }
}
