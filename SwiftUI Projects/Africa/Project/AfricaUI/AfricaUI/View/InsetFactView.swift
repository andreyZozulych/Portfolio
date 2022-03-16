//
//  InsetFactView.swift
//  AfricaUI
//
//  Created by Andrii Zozulych on 17.10.2021.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    
    var animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self){ item in
                    Text(item)
                        .font(.system(.body, design: .serif))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 15)
                }
            }//: Tab
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: Box
    }
}
// MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
