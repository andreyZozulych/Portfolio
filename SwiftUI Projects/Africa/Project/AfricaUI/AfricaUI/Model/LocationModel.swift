//
//  LocationModel.swift
//  AfricaUI
//
//  Created by Andrii Zozulych on 19.10.2021.
//

import SwiftUI
import MapKit

struct NationalParkLocation: Codable, Identifiable{
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed property
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
