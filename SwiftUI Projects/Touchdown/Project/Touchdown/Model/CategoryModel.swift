//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Andrii Zozulych on 21.09.2021.
//

import Foundation


struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
