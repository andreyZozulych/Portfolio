//
//  ContentView.swift
//  Touchdown
//
//  Created by Andrii Zozulych on 20.09.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - FUNCTIONS
    var body: some View {
        ZStack{
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0){
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 0){
                            FeaturedTabView()
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                                .padding(.vertical, 20)
                        }//: VStack
                    
                    
                    CategoryGridView()
                    
                    TitleView(title: "Helmets")
                    
                    LazyVGrid(columns: gridLayout, spacing: 15) {
                        ForEach(products){ product in
                            ProductItemView(product: product)
                                .onTapGesture {
                                    feedback.impactOccurred()
                                    
                                    withAnimation(.easeOut){
                                        shop.selectedProduct = product
                                        shop.showingProduct = true
                                    }
                                }
                        }//: Loop
                    }//: Grid
                    .padding(15)
                    
                    TitleView(title: "Brands")
                        
                    BrandGridView()
                        
                    FooterView()
                        .padding(.horizontal)
                    }//: SCROLL
                    
                }//: VStack
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            }
            else {
                ProductDetailView()
            }
        }//: ZSTack
        .ignoresSafeArea(.all, edges: .top)
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .environmentObject(Shop())
    }
}
