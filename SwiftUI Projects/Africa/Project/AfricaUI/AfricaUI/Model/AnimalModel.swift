//
//  AnimalModel.swift
//  AfricaUI
//
//  Created by Andrii Zozulych on 16.10.2021.
//

import SwiftUI

struct Animal: Codable, Identifiable{
    var id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
