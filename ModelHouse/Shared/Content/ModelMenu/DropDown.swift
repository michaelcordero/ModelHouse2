//
//  DropDown.swift
//  ModelHouse (iOS)
//
//  Created by Jonas Toussaint on 4/23/23.
//

import SwiftUI

struct DropDown: View {
    @State private var isOptionPresented: Bool = false
    @Binding var selectedOption: ModelOptions?
    
    let placeHolder: String
    let options: [ModelOptions]
    
    var body: some View {
        
        HStack {
           
            Button(action: {
                withAnimation {
                    self.isOptionPresented.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption == nil ? placeHolder : selectedOption!.option)
                        .fontWeight(.medium)
                        .foregroundColor(selectedOption == nil ? .gray: .black)
                    
                    Spacer()
                    
                    Image(systemName: self.isOptionPresented ? "chevron.up" :
                    "chevron.down")
                    //.fontWeight(.medium)
                    //.foregroundColor(.black)
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 2)
            }
            .overlay(alignment: .top) {
                VStack {
                    if self.isOptionPresented {
                        Spacer(minLength: 60)
                        DropdownMenuList(options: self.options) { option in
                            self.isOptionPresented = false
                            self.selectedOption = option
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, self.isOptionPresented
                      ? CGFloat(self.options.count * 32) > 300
                        ? 300 + 30
                        : CGFloat(self.options.count * 32) + 30
                      : 0
            )
    }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown(
            selectedOption: .constant(nil),
            placeHolder: "Select your model",
            options: ModelOptions.testingAllModel
        )
    }
}
}
