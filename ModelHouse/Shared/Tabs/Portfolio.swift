//
//  Portfolio.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/19/23.
//

import SwiftUI

struct Portfolio: View {
    var body: some View {
        ZStack {
            Color.blue
            Image(systemName: "chart.pie.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
        }
    }
}

struct Portfolio_Previews: PreviewProvider {
    static var previews: some View {
        Portfolio()
    }
}
