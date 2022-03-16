//
//  FruitModel.swift
//  UIFruits
//
//  Created by Andrii Zozulych on 10.08.2021.
//

import SwiftUI

// MARK: - Fruit Data Model

struct Fruit: Identifiable{
    
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
