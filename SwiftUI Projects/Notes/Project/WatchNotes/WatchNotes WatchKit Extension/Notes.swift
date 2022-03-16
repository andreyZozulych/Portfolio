//
//  Notes.swift
//  WatchNotes WatchKit Extension
//
//  Created by Andrii Zozulych on 14.08.2021.
//

import Foundation

struct Note: Identifiable, Codable{
    let id: UUID
    let text: String
}
