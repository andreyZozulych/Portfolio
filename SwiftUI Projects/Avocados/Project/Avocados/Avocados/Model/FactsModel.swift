//
//  FactsModel.swift
//  Avocados
//
//  Created by Andrii Zozulych on 22.08.2021.
//

import SwiftUI

// MARK: - FACTS MODEL

struct Fact: Identifiable{
    var id = UUID()
    var image: String
    var content: String
}
