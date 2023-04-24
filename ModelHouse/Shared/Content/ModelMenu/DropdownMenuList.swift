//
//  DropdownMenuList.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/23/23.
//

import SwiftUI

struct DropdownMenuList: View {
    
    let options: [ModelOptions]
    
    let onSelectedAction: (_ option: ModelOptions) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2){
                ForEach(options) { option in
                    DropdownMenuListRow(option: option, onSelectedAction:
                        self.onSelectedAction)
                }
            }
        }
        .frame(height: CGFloat(self.options.count * 32) > 300
               ? 300
               : CGFloat(self.options.count * 32)
        )
        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 2)
        }
    }
}

struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuList(options: ModelOptions.testingAllModel,
                         onSelectedAction: { _ in })
    }
}
