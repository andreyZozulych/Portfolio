//
//  SettingsRowView.swift
//  UIFruits
//
//  Created by Andrii Zozulych on 13.08.2021.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - Properties
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - Body
    
    var body: some View {
        VStack{
            HStack{
                Text(name).foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                }
                else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }
                else{
                    EmptyView()
                }
            }//: HStack
            Divider().padding(.vertical, 4)
        }//: VStack
    }
}

// MARK: - Preview

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SettingsRowView(name: "Developer", content: "John / Jane")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 475, height: 60))
                .padding()
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                .previewLayout(.fixed(width: 475, height: 60))
                .padding()
        }
    }
}
