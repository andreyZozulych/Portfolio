//
//  ContentView.swift
//  Developers
//
//  Created by Andrii Zozulych on 15.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    var cards: [Card] = cardData
    
    // MARK: - FUNCTIONS
    
    // MARK: - BODY
    
    var body: some View {
        
        TabView{
            ForEach(cardData) { item in
                CardView(card: item)
            }//: Loop
        } //: Tab
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 565)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .padding(.vertical,20)
        
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
