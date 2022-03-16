//
//  ExternalWebView.swift
//  AfricaUI
//
//  Created by Andrii Zozulych on 17.10.2021.
//

import SwiftUI

struct ExternalWebView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox{
            
            HStack{
                Group{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
                
                Spacer()
                Image(systemName: "globe")
                Text("Wikipedia")
                
            }
        }//: Box
    }
}
// MARK: - PREVIEW
struct ExternalWebView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
