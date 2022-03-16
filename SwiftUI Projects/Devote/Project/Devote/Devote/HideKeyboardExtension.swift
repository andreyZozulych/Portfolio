//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Andrii Zozulych on 04.11.2021.
//

import SwiftUI

#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
