//
//  Colors.swift
//  FlightOffers
//
//  Created by Kishan Nakum on 06/06/22.
//
/*------------------------------------------------
 // Colors Information
 /*
  *Note:-
  - All Colors used throughout the App for Dark/Light Model
  */
 ------------------------------------------------*/

import Foundation
import SwiftUI

extension Color {
    static let theme = Theme()
}

struct Theme {
    let background = Color("Background")
    let darkShadow = Color("DarkShadow")
    let lightShadow = Color("LightShadow")
    let cardColor = Color("CardColor")
    let fontColor = Color("FontColor")
    let lightPink = Color("LightPink")
}
