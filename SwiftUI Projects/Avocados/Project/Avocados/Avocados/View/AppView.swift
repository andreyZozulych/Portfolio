//
//  AppView.swift
//  Avocados
//
//  Created by Andrii Zozulych on 21.08.2021.
//

import SwiftUI

struct AppView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - FUNCTIONS
    
    var body: some View {
        TabView{
            AvocadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            SettingView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.primary)
    }
}
// MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .previewDevice("iPhone 12 Pro").previewDisplayName("iPhone 12 Pro")
    }
}
