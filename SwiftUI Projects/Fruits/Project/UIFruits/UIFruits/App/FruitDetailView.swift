//
//  FruitDetailView.swift
//  UIFruits
//
//  Created by Andrii Zozulych on 12.08.2021.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: - Properties
    var fruit:Fruit
    // MARK: - Body
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing:20){
                    // HEADER
                    FruitHeaderView(fruit: fruit)
                        
                    VStack(alignment: .leading, spacing: 20){
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // HEADLINE
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        // NUTRIENTS
                        FruitNutrientsView(fruit: fruit)
                        // SUBHEADLINE
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        // DESCRIPTION
                        Text(fruit.description)
                            .multilineTextAlignment(.leading) 
                        // LINK
                        SourceLinkView()
                }//:VStack
                    .padding(.horizontal,20)
                    .frame(maxWidth:640, alignment: .center)
                    
            }//: VStack
                .navigationBarTitle(fruit.title, displayMode: .inline)
                .navigationBarHidden(true)
                
        }//: ScrollView
            .edgesIgnoringSafeArea(.top)
            
    }//: Navigation
        .navigationViewStyle(StackNavigationViewStyle())
}
// MARK: - Preview
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit:fruitsData[1])
    }
}
}
