//
//  HeaderModel.swift
//  Avocados
//
//  Created by Andrii Zozulych on 22.08.2021.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable{
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
