//
//  SourceLinkView.swift
//  UIFruits
//
//  Created by Andrii Zozulych on 12.08.2021.
//

import SwiftUI

struct SourceLinkView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        GroupBox(){
            HStack{
                Text("Content source")
                Spacer()
                Link("Wikipedia",destination: URL(string: "https://wikipedia.com")!)
                    .foregroundColor(.black) 
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}
// MARK: - Preview
struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
