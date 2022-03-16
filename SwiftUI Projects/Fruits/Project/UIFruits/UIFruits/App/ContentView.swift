//
//  ContentView.swift
//  UIFruits
//
//  Created by Andrii Zozulych on 10.08.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @State private var isShowingSettings: Bool = false
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - Body
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()){ item in
                    NavigationLink(destination: FruitDetailView(fruit:item)){
                    FruitRowView(fruit: item)
                        .padding(.vertical,4)
                    }
                }
            }//: List
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                Button(action:{
                    isShowingSettings = true
                }){
                    Image(systemName: "info.circle")
                }
            )
            .sheet(isPresented: $isShowingSettings){
                SettingsView()
            }
        }//: Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
