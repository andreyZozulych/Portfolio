//
//  OnboardingView.swift
//  UIFruits
//
//  Created by Andrii Zozulych on 10.08.2021.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    var fruits: [Fruit] = fruitsData
    // MARK: - Body
    var body: some View {
        TabView{
            ForEach(fruits) { item in
                FruitCardView(fruit: item)
            }
            //: Loop
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,20)
    }
}
// MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().previewDevice("iPhone 12 Pro").previewDisplayName("iPhone 12 Pro")
    }
}
