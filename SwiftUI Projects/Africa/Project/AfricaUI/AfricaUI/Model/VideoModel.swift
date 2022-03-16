//
//  VideoModel.swift
//  AfricaUI
//
//  Created by Andrii Zozulych on 18.10.2021.
//

import SwiftUI

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String{
        "video-\(id)"
    }
}
