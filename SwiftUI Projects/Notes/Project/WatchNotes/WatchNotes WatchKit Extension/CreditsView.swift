//
//  CreditsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Andrii Zozulych on 14.08.2021.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    @State private var randomNumer: Int = Int.random(in: 1..<4)
    
    private var randomImage: String{
        return "developer-no\(randomNumer)"
    }
    // MARK: - FUNCTIONS
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3){
            // Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            
            // CONTENT
            Text("Andrii Zozulych")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }//: VStack
    }
}

// MARK: - PREVIEW

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
