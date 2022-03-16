//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Andrii Zozulych on 21.08.2021.
//

import SwiftUI

struct RipeningStagesView: View {
    
    // MARK: - PROPERTIES
    
    var ripeningStages: [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            VStack{
                Spacer()
                HStack(alignment: .center, spacing: 25, content: {
                    ForEach(ripeningStages){ item in
                        RipeningView(ripening: item)
                    }
                })
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
        .padding(.bottom, 50)
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView()
    }
}
