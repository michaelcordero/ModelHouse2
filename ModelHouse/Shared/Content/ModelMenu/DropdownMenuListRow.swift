//
//  DropdownMenuListRow.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/23/23.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: ModelOptions
    let onSelectedAction: (_ option: ModelOptions) -> Void

    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
        Text(option.option)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
    
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: ModelOptions.testingSingleModel,
                            onSelectedAction: {_ in })
    }
}
